import math


class Dir:
    def __init__(self, name, parent):
        self.name = name
        self.parent = parent
        self.subdir = []
        self.size = 0

    def __str__(self):
        return "(" + self.name + ", Size: " + str(self.size) + ", Subdir: " + str(self.subdir) + ")"

    def __repr__(self):
        return str(self)

    def getSubdir(self, nodeName):
        for dir in self.subdir:
            if dir.name == nodeName:
                return dir

    def show(self):
        print(self)
        print()
        if len(self.subdir) == 0:
            return
        for dir in self.subdir:
            dir.show()


def main():
    lines = open("input.txt", "r").read().splitlines()
    root = setup(lines)
    totalSize(root)
    print("Part 1: " + str(countsmallDirSize(root, 0)))
    availSpace = 70000000 - root.size
    needSpace = 30000000 - availSpace
    infDir = Dir("INF", None)
    infDir.size = math.inf
    print("Part 2: " + str(findSmallBig(root, needSpace, infDir).size))


def findSmallBig(node, needSpace, curr):
    if curr.size > node.size > needSpace:
        curr = node
    for dir in node.subdir:
        curr = findSmallBig(dir, needSpace, curr)
    return curr


def countsmallDirSize(node, n):
    if node.size < 100000:
        n += node.size
    for dir in node.subdir:
        n = countsmallDirSize(dir, n)
    return n


def totalSize(node):
    if len(node.subdir) == 0:
        return node.size
    size = node.size
    for dir in node.subdir:
        size += totalSize(dir)
    node.size = size
    return size


def setup(lines):
    startNode = cwdNode = Dir("/", None)
    for line in lines[1:]:
        match line[0]:
            case "$":
                match line[2]:
                    case "c":
                        match line[5]:
                            case ".":
                                cwdNode = cwdNode.parent
                            case _:
                                cwdNode = cwdNode.getSubdir(line[5:])
                    case "l":
                        pass
            case "d":
                cwdNode.subdir += [Dir(line[4:], cwdNode)]
            case _:
                cwdNode.size += int(line[:line.find(" ")])
    return startNode


if __name__ == "__main__":
    main()
