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

# Build PDFs in parallel, but throttle concurrency: unbounded parallel lualatex
# (especially the heavy beamer slide decks) exhausts memory on CI runners and the
# processes get killed, silently producing no output.
$results = $targets | ForEach-Object -ThrottleLimit 2 -Parallel {
  # Parallel runspaces do not reliably inherit the caller's location.
  Set-Location $using:currentDir
  $t = $_

  if ($t.Type -eq "Slides") {
    Write-Host "Building slides for $($t.Source)"
    pandoc -f markdown+smart+yaml_metadata_block+rebase_relative_paths --toc --slide-level 2 --number-section --pdf-engine lualatex -t beamer -H preamble.tex -F pandoc-plantuml -o $t.Pdf $t.Source
  }
  else {
    Write-Host "Building document for $($t.Source)"
    pandoc -f markdown+smart+yaml_metadata_block+rebase_relative_paths --toc --toc-depth 1 --number-section --pdf-engine lualatex -F pandoc-plantuml -o $t.Pdf $t.Source
  }

  [PSCustomObject]@{
    Pdf      = $t.Pdf
    ExitCode = $LASTEXITCODE
  }
}

# Fail the build if any PDF did not compile, instead of silently shipping a
# partial result.
$failed = $results | Where-Object { $_.ExitCode -ne 0 -or -not (Test-Path $_.Pdf) }
if ($failed) {
  Write-Host "##[error]The following PDF builds failed:"
  $failed | ForEach-Object { Write-Host " - $($_.Pdf) (exit code $($_.ExitCode))" }
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
