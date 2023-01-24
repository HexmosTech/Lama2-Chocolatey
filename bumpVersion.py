import sys

def main(url):
    version = url.strip().split('/')[-2].replace('v', '')
    with open('lama2.nuspec') as f:
        lines = f.readlines()
        for index, row in enumerate(lines):
            if '<version>' in row:
                lines[index] = f'    <version>{version}</version>\n'
    with open('lama2.nuspec', 'w') as f:        
        f.writelines(lines)    
    
if __name__ == '__main__':
    main(sys.argv[1])
