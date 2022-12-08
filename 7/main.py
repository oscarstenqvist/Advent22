class Folder:
    def __init__(self, name, parent):
        self.name = name
        self.parent = parent
        self.subFolders = []
        self.size = 0

    def __str__(self):
        return "(" + self.name + ":" + str(self.size) + str(self.subFolders) + ")"

    def __repr__(self):
        return str(self)


def main():
    lines = open("input.txt", "r").read().splitlines()
    folders = initFolder(None, None, lines)
    '''for folder in folders:
        for subfolder in folder.subFolders:
            folder.size += subfolder.size
    '''
    print(folders)


def initFolder(folder, folderParent, lines):
    for index in range(len(lines)):
        line = lines[index]
        if line[0] == "$":
            if line[2] == "c":
                if line[5] == ".":
                    pass
                    #print("How to go back recursivly?")
                    # return initFolder(folderParent, folderParent.parent, lines[index+1:])
                else:
                    if folder == None:
                        folder = Folder(line[5:], folderParent)
                    else:
                        return [folder] + initFolder(None, folder, lines[index:])
            else:
                continue
        elif line[:3] == "dir":
            searchIndex = lines.index("$ cd " + line[4:])
            folder.subFolders += initFolder(None, folder, lines[searchIndex:])
        else:
            folder.size += int(line[:line.index(" ")])
    return []


if __name__ == "__main__":
    main()
