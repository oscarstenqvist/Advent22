def main():
    lines = open("tinput.txt", "r").read().splitlines()
    p1(lines)
    return


def p1(lines, prevPos):
    if lines == []:
        return []
    pos = prevPos
    line = lines[0]
    match line:
        case line[0]


if __name__ == "__main__":
    main()
