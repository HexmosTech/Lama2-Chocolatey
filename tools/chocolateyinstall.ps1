$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://github.com/HexmosTech/Lama2/releases/download/v1.3.2/l2-v1.3.2-windows-386.zip'
$url64      = 'https://github.com/HexmosTech/Lama2/releases/download/v1.3.2/l2-v1.3.2-windows-amd64.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  url64bit      = $url64

  checksum      = 'DE0122AE3EAFA1EBD46759C480ED114E2E416269A7541242FCC51DB17506FC8F'
  checksumType  = 'sha256' 
  checksum64    = 'BEFCFD56E138C4C274FCA7659C0FDF73C97977C582C2392E8FE59C1919F90F95'
  checksumType64= 'sha256' 

}

Install-ChocolateyZipPackage @packageArgs 
