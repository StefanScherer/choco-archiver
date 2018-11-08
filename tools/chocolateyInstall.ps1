$packageName = 'archiver'
$url = 'https://github.com/mholt/archiver/releases/download/v3.0.0/arc_windows_386.exe'
$url64 = 'https://github.com/mholt/archiver/releases/download/v3.0.0/arc_windows_amd64.exe'
$checksum = '1db22614f241c87426c4d6a505582cbd95f4ca249efc86aaf3039471d83fec4c'
$checksum64 = '1db22614f241c87426c4d6a505582cbd95f4ca249efc86aaf3039471d83fec4c'
$checksumType = 'sha256'
$checksumType64 = $checksumType

$destination = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$file = "$($destination)\arc.exe"

if (![System.IO.Directory]::Exists($destination)) {[System.IO.Directory]::CreateDirectory($destination)}

Get-ChocolateyWebFile `
  -PackageName    $packageName `
  -FileFullPath   $file `
  -Url            $url `
  -Url64bit       $url64 `
  -Checksum       $checksum `
  -Checksum64     $checksum64 `
  -ChecksumType   $checksumType `
  -ChecksumType64 $checksumType64
