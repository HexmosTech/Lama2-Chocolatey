$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://github.com/HexmosTech/Lama2/releases/download/v1.2.2/l2-v1.2.2-windows-386.zip'
$url64      = 'https://github.com/HexmosTech/Lama2/releases/download/v1.2.2/l2-v1.2.2-windows-amd64.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  url64bit      = $url64

  checksum      = '464E720F6F5C383B7FD3E670083717F06D7278729F7F3BF4257239D1F59A425D'
  checksumType  = 'sha256' 
  checksum64    = 'A12961F5C6C61142FEF7D774C8F0CF41CCC5E29E81C64CAE82C621D8CE97EDF8'
  checksumType64= 'sha256' 

}

Install-ChocolateyZipPackage @packageArgs 
