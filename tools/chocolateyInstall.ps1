$packageName = 'archiver'
$url64 = 'https://github.com/mholt/archiver/releases/download/v3.1.0/arc_windows_amd64.exe'
$checksum64 = 'c9a388a66d7f87cbdb1ca42d08721c4f894e6028fe3250e66a0100cdb7e5205d'
$checksumType64 = $checksumType

$destination = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$file = "$($destination)\arc.exe"

if (![System.IO.Directory]::Exists($destination)) {[System.IO.Directory]::CreateDirectory($destination)}

Get-ChocolateyWebFile `
  -PackageName    $packageName `
  -FileFullPath   $file `
  -Url            $url64 `
  -Url64bit       $url64 `
  -Checksum       $checksum64 `
  -Checksum64     $checksum64 `
  -ChecksumType   $checksumType64 `
  -ChecksumType64 $checksumType64
