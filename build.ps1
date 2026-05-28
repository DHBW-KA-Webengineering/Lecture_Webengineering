$currentDir = Get-Location


if ($args.Length -ne 0) {
  $files = $args
  $zip = 0
}
else {
  $files = Get-ChildItem -Recurse -Path Material -Filter  *.md
  $zip = 1
}

$jobs = @()

Write-Host "Building PDFs for the following files:"
foreach ($arg in $files) {
  Write-Host "- $arg"
}


foreach ($arg in $files) {
  $pdfName = "build/" + ((Get-Item $arg).Directory.Basename) + "/" + ((Get-Item $arg).Basename) + ".pdf"
  New-Item -ItemType Directory -Path (Split-Path $pdfName) -Force > $null

  $jobs += Start-Job -ScriptBlock { 
    param($arg, $pdfName)
    $pdfType = (Get-ChildItem $arg).Directory.Name
    if ($pdfType -eq "Slides") {
      Write-Host "Building slides for $arg"
      pandoc -f markdown+smart+yaml_metadata_block+rebase_relative_paths --toc --slide-level 2 --number-section --pdf-engine lualatex -t beamer -H preamble.tex -F pandoc-plantuml -o $pdfName $arg
    }
    else {
      pandoc -f markdown+smart+yaml_metadata_block+rebase_relative_paths --toc --toc-depth 1 --number-section --pdf-engine lualatex -F pandoc-plantuml -o $pdfName $arg
    }
  } -ArgumentList $arg, $pdfName
}

Wait-Job $jobs




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
  Remove-Item -Path "Material/Slides/99_Script.md" -Force
  
  Set-Location .\build
  Compress-Archive -Force -Path .\* -DestinationPath ..\build.zip
  Set-Location $currentDir
}

Remove-Item -Path "tex2pdf.-*" -Force -Recurse