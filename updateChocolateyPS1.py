import sys 

def main(url, checksum, url64, checksum64):
    with open('tools/chocolateyinstall.ps1') as ps1:
        line = ps1.readlines()
        for index, row in enumerate(line):
            splitLine = row.split()
            if len(splitLine) < 1:
                continue
            if splitLine[0] == '$url' and splitLine[1] == "=":
                splitLine[2] = f"'{url.strip()}'"
                line[index] = ' '.join(splitLine) + '\n'
            if splitLine[0] == '$url64' and splitLine[1] == "=":
                splitLine[2] = f"'{url64.strip()}'"
                line[index] = ' '.join(splitLine) + '\n'
            if splitLine[0] == 'checksum' and splitLine[1] == "=":
                splitLine[2] = f"'{checksum.strip()}'"
                line[index] = ' '.join(splitLine) + '\n'
            if splitLine[0] == 'checksum64' and splitLine[1] == "=":
                splitLine[2] = f"'{checksum64.strip()}'"
                line[index] = ' '.join(splitLine) + '\n'
    with open('tools/chocolateyinstall.ps1', 'w') as ps1:        
        ps1.writelines(line)
                

if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4])
