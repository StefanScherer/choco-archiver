$packageName = 'archiver'
$url = 'https://github.com/mholt/archiver/releases/download/v2.1/archiver_windows_386.exe'
$url64 = 'https://github.com/mholt/archiver/releases/download/v2.1/archiver_windows_amd64.exe'
$checksum = 'a826769480e309adb2578d2dd19930dee2e7a9ecf52f9760df8af11430f4052a'
$checksum64 = 'a9e91b3adef6f89e6eb3d846ac5d49b78e0c28d8ef446392c37c26b8ec4fcfd2'
$checksumType = 'sha256'
$checksumType64 = $checksumType

$destination = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$file = "$($destination)\archiver.exe"

if (![System.IO.Directory]::Exists($destination)) {[System.IO.Directory]::CreateDirectory($destination)}

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $file -Url $url -Url64bit $url64 -Checksum $checksum -Checksum64 $checksum64 -ChecksumType $checksumType -ChecksumType64 $checksumType64
