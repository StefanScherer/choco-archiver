$packageName = 'archiver'
$url = 'https://github.com/mholt/archiver/releases/download/v2.1/archiver_windows_386.exe'
$url64 = 'https://github.com/mholt/archiver/releases/download/v2.1/archiver_windows_amd64.exe'
$checksum = '0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5'
$checksum64 = '0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5'
$checksumType = 'sha256'
$checksumType64 = $checksumType

$destination = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$file = "$($destination)\archiver.exe"

if (![System.IO.Directory]::Exists($destination)) {[System.IO.Directory]::CreateDirectory($destination)}

Get-ChocolateyWebFile $packageName $file $url $url64 $checksum $checksum64 $checksumType $checksumType64
