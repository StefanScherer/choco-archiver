$packageName = 'archiver'
$url = 'https://github.com/mholt/archiver/releases/download/v2.0/archiver_windows_386.exe'
$url64 = 'https://github.com/mholt/archiver/releases/download/v2.0/archiver_windows_amd64.exe'
$checksum = '730578a0f6dc7270825d87dd0f9e5c60bdeeafa517bc141cc15af5629ca26f0b'
$checksum64 = 'c23eab86a8f77e446f2b5dbb03305ac9acfb5187108a0090a4bcb3d908fa9785'
$checksumType = 'sha256'
$checksumType64 = $checksumType

$destination = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$file = "$($destination)\archiver.exe"

if (![System.IO.Directory]::Exists($destination)) {[System.IO.Directory]::CreateDirectory($destination)}

Get-ChocolateyWebFile $packageName $file $url $url64 $checksum $checksum64 $checksumType $checksumType64
