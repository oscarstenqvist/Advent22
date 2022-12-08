def main():
    lines = open("input.txt", "r").read().splitlines()
    print("Part 1: " + str(p1(lines)))
    print("Part 2: " + str(p2(lines)))
    return


def p1(lines):
    rightRowTrees = getTrees(lines, "row", -1)
    leftRowTrees = getTrees(lines, "rowReverse", -1)
    upColTrees = getTrees(lines, "col", -1)
    downColTrees = getTrees(lines, "colReverse", -1)
    totalTrees = list(dict.fromkeys(
        upColTrees + downColTrees + leftRowTrees + rightRowTrees))
    return len(totalTrees)


def p2(lines):
    sceneList = []
    for lineIndex in range(len(lines)):
        for treeIndex in range(len(lines[0])):
            colLine = getColLines(lines)[treeIndex]
            tree = lines[lineIndex][treeIndex]
            treeRight = lines[lineIndex][treeIndex+1:]
            treeLeft = reverseString(lines[lineIndex][:treeIndex])
            treeDown = colLine[lineIndex+1:]
            treeUp = reverseString(colLine[:lineIndex])
            rightScore = findSmallTrees(treeRight, tree)
            leftScore = findSmallTrees(treeLeft, tree)
            downScore = findSmallTrees(treeDown, tree)
            upScore = findSmallTrees(treeUp, tree)
            sceneScore = rightScore * leftScore * upScore * downScore
            sceneList += [sceneScore]
    return max(sceneList)


def findSmallTrees(line, treeHeight):
    smallTrees = 1
    for tree in line:
        if int(tree) < int(treeHeight):
            smallTrees += 1
        else:
            return smallTrees
    return smallTrees - 1


def reverseString(line):
    return line[::-1]


def reverseStringList(lines):
    newLines = []
    for line in lines:
        newLine = line[::-1]
        newLines += [newLine]

    return newLines


def getColLines(lines):
    colLines = []
    colLines += [""]*(len(lines[0]))
    for line in lines:
        for index in range(len(line)):
            colLines[index] += line[index]
    return colLines


def getTrees(lines, direction, height):
    if direction == "col" or direction == "colReverse":
        lines = getColLines(lines)
    if direction == "colReverse" or direction == "rowReverse":
        lines = reverseStringList(lines)
    currHeight = height
    visibleTrees = []
    for line in lines:
        for treeHeight in line:
            if int(treeHeight) > currHeight:
                currHeight = int(treeHeight)
                match direction:
                    case "col":
                        x = lines.index(line)
                        y = line.index(treeHeight)
                    case "colReverse":
                        x = lines.index(line)
                        y = len(line)-1-line.index(treeHeight)
                    case "row":
                        x = line.index(treeHeight)
                        y = lines.index(line)
                    case "rowReverse":
                        x = len(line)-1-line.index(treeHeight)
                        y = lines.index(line)
                visibleTrees += [(x, y)]
        currHeight = -1
    return visibleTrees


if __name__ == "__main__":
    main()
