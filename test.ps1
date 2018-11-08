"Running tests"
$ErrorActionPreference = "Stop"
if ($env:APPVEYOR_BUILD_VERSION) {
  # run in CI
  $version = $env:APPVEYOR_BUILD_VERSION -replace('\.[^.\\/]+$')
} else {
  # run manually
  [xml]$spec = Get-Content archiver.nuspec
  $version = $spec.package.metadata.version
}

"TEST: Version $version in archiver.nuspec file should match"
[xml]$spec = Get-Content archiver.nuspec
if ($spec.package.metadata.version.CompareTo($version)) {
  Write-Error "FAIL: wrong version in nuspec file!"
}

"TEST: Package should contain only install script"
Add-Type -assembly "system.io.compression.filesystem"
$zip = [IO.Compression.ZipFile]::OpenRead("$pwd\archiver.$version.nupkg")
if ($zip.Entries.Count -ne 5) {
  Write-Error "FAIL: Wrong count in nupkg!"
}
$zip.Dispose()

"TEST: Installation of package should work"
. choco install -y archiver -source .

"TEST: Arc binary is in path"
$path = $(cmd /c where arc.exe)
Write-Output "path = $path"
if ($path -eq "C:\ProgramData\chocolatey\bin\arc.exe") {
  Write-Host "PASS: arc binary found"
} else {
  Write-Error "FAIL: arc binary not found"
}

"TEST: Uninstall show remove the binary"
. choco uninstall archiver
try {
  . arc
  Write-Error "FAIL: arc binary still found"
} catch {
  Write-Host "PASS: arc binary not found"
}

"TEST: Finished"
