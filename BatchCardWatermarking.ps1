<#
Script requires ImageMagick from:
https://imagemagick.org/script/index.php
#>

$watermarkPath = $PSScriptRoot + "/AnimoWatermarkLackey476x648.png"
$sourcePath = $PSScriptRoot + "/sets/setimages/original/"
$outputPath = $PSScriptRoot + "/sets/setimages/general/"
$sourceImages = Get-ChildItem  -path $sourcePath

if(!(Test-Path -Path $outputPath))
{
    New-Item $outputPath -ItemType Directory
}

foreach($image in $sourceImages)
{
  write-host $image.Name

  $output = $outputPath + $image.Name
  magick composite -gravity Center $watermarkPath $image.FullName $output
}