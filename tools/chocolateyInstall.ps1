$packageName = 'archiver'
$url = 'https://github.com/mholt/archiver/releases/download/v3.1.0/arc_windows_386.exe'
$url64 = 'https://github.com/mholt/archiver/releases/download/v3.1.0/arc_windows_amd64.exe'
$checksum = '0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5'
$checksum64 = 'c9a388a66d7f87cbdb1ca42d08721c4f894e6028fe3250e66a0100cdb7e5205d'
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
