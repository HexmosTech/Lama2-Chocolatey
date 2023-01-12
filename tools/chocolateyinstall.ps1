$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$lamaUrl = python -c "
import struct
import json
import http.client

def get_file():
    conn = http.client.HTTPSConnection('api.github.com')
    payload = ''
    headers = {
        'User-Agent': 'Hexmos'
    }
    conn.request('GET', '/repos/HexmosTech/Lama2/releases/latest', payload, headers)
    res = conn.getresponse()
    data = res.read()
    return json.loads(data.decode('utf-8'))

def get_platform():
    platform = 8*struct.calcsize('P')
    return 'amd64' if platform == 64 else '386'

def search(files, platform):
    search_string = 'windows-' + platform
    for row in files['assets']:
        if search_string in row['name'] and 'md5' not in row['name']:
            return row['browser_download_url']            

def main():
    files = get_file()
    platform = get_platform()
    download_link = search(files, platform)
    return download_link

if __name__ == '__main__':
    link = main()
    print(link)
" | Out-String

$url        = $lamaUrl 
$url64      = $lamaUrl 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  url64bit      = $url64

  checksum      = ''
  checksumType  = 'sha256' 
  checksum64    = ''
  checksumType64= 'sha256' 

}

Install-ChocolateyZipPackage @packageArgs 