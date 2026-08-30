$currentDir = Get-Location


if ($args.Length -ne 0) {
  $files = $args
  $zip = 0
}
else {
  $files = Get-ChildItem -Recurse -Path Material -Filter  *.md
  $zip = 1
}

Write-Host "Building PDFs for the following files:"
foreach ($arg in $files) {
  Write-Host "- $arg"
}


# Pre-compute targets and create output directories in the main thread to avoid
# races between parallel workers creating the same directory.
$targets = foreach ($arg in $files) {
  $item = Get-Item $arg
  $pdfName = "build/" + $item.Directory.BaseName + "/" + $item.BaseName + ".pdf"
  New-Item -ItemType Directory -Path (Split-Path $pdfName) -Force > $null
  [PSCustomObject]@{
    Source = $item.FullName
    Pdf    = $pdfName
    Type   = $item.Directory.Name
  }
}

# Build PDFs in parallel, but throttle concurrency to keep peak load on CI
# runners reasonable. Each worker captures pandoc's full output and exit code
# into its result object instead of writing to the console: parallel runspaces
# interleave their output unreadably, so we emit one clean, ordered report
# afterwards in the main thread.
$results = $targets | ForEach-Object -ThrottleLimit 2 -Parallel {
  # Parallel runspaces do not reliably inherit the caller's location.
  Set-Location $using:currentDir
  $t = $_

  try {
    if ($t.Type -eq "Slides") {
      $log = pandoc -f markdown+smart+yaml_metadata_block+rebase_relative_paths --toc --slide-level 2 --number-section --pdf-engine lualatex -t beamer -H preamble.tex -F pandoc-plantuml -o $t.Pdf $t.Source 2>&1 | Out-String
    }
    else {
      $log = pandoc -f markdown+smart+yaml_metadata_block+rebase_relative_paths --toc --toc-depth 1 --number-section --pdf-engine lualatex -F pandoc-plantuml -o $t.Pdf $t.Source 2>&1 | Out-String
    }
    $code = $LASTEXITCODE
  }
  catch {
    $log = ($_ | Out-String)
    $code = 1
  }

  [PSCustomObject]@{
    Pdf      = $t.Pdf
    Source   = $t.Source
    ExitCode = $code
    Ok       = ($code -eq 0 -and (Test-Path $t.Pdf))
    Log      = $log
  }
}

# Emit an ordered status line per file so the build log is readable.
foreach ($r in ($results | Sort-Object Pdf)) {
  if ($r.Ok) { Write-Host "OK    $($r.Pdf)" }
  else { Write-Host "FAIL  $($r.Pdf) (exit code $($r.ExitCode))" }
}

# Fail the build if any PDF did not compile, instead of silently shipping a
# partial result. Print the captured pandoc/LaTeX output for each failure.
$failed = $results | Where-Object { -not $_.Ok }
if ($failed) {
  foreach ($r in $failed) {
    Write-Host "##[error]Build failed for $($r.Source) -> $($r.Pdf) (exit code $($r.ExitCode))"
    Write-Host $r.Log
  }
  exit 1
}




if ($zip) {
  # Build slides as script
  Set-Content "Material/Slides/99_Script.md"  "---
title: 'Vorlesung Webengineering 1'
date: '$(Get-Date -format "yyyy-MM-dd")'
author: 'Lukas Panni'
header-includes: |
  \usepackage{fancyhdr}
  \pagestyle{fancy}
  \fancyfoot[R]{Licensed under CC-BY-SA-4.0}
..."
  pandoc -f markdown+smart+yaml_metadata_block+rebase_relative_paths --toc --toc-depth 1 --pdf-engine lualatex -F pandoc-plantuml --title="Vorlesung Webengineering" -o "build/script.pdf" $(Get-ChildItem -Recurse -Path Material/Slides -Filter *.md)
  $scriptExit = $LASTEXITCODE
  Remove-Item -Path "Material/Slides/99_Script.md" -Force
  if ($scriptExit -ne 0 -or -not (Test-Path "build/script.pdf")) {
    Write-Host "##[error]Building build/script.pdf failed (exit code $scriptExit)"
    exit 1
  }

  Set-Location .\build
  Compress-Archive -Force -Path .\* -DestinationPath ..\build.zip
  Set-Location $currentDir
}

Remove-Item -Path "tex2pdf.-*" -Force -Recurse
