def main():
    lines = open("input.txt", "r").read().splitlines()
    rightRowTrees = getTrees(lines, "row")
    leftRowTrees = getTrees(lines, "rowReverse")
    upColTrees = getTrees(lines, "col")
    downColTrees = getTrees(lines, "colReverse")
    totalTrees = list(dict.fromkeys(
        upColTrees + downColTrees + leftRowTrees + rightRowTrees))
    print("Part 1: " + str(len(totalTrees)))
    return


def reverse(lines):
    newLines = []
    for line in lines:
        newLine = ""
        for char in line:
            newLine = char + newLine
        newLines += [newLine]

    return newLines


def getColLines(lines):
    colLines = []
    colLines += [""]*(len(lines[0]))
    for line in lines:
        for index in range(len(line)):
            colLines[index] += line[index]
    return colLines


def getTrees(lines, direction):
    if direction == "col" or direction == "colReverse":
        lines = getColLines(lines)
    if direction == "colReverse" or direction == "rowReverse":
        lines = reverse(lines)
    currHeight = -1
    visibleTrees = []
    for line in lines:
        for treeHeight in line:
            if int(treeHeight) > currHeight:
                currHeight = int(treeHeight)
                match direction:
                    case "col":
                        visibleTrees += [(lines.index(line),
                                          line.index(treeHeight))]
                    case "colReverse":
                        visibleTrees += [(lines.index(line),
                                          len(line)-1-line.index(treeHeight))]
                    case "row":
                        visibleTrees += [(line.index(treeHeight),
                                          lines.index(line))]
                    case "rowReverse":
                        visibleTrees += [(len(line)-1 -
                                          line.index(treeHeight), lines.index(line))]
        currHeight = -1
    return visibleTrees


if __name__ == "__main__":
    main()
