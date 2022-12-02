from functools import reduce


def main():
    file = open("input.txt", "r")
    lines = file.readlines()
    print("Part 1: " + str(reduce(f1, lines)))
    print("Part 2: " + str(reduce(f2, lines)))
    return


def f1(a, b):
    if isinstance(a, str):  # First iteration
        return f1(f1(0, a), b)
    else:
        compare = b.rstrip()  # Strip away newline
    match compare:
        case "A X":
            return a + 1 + 3
        case "A Y":
            return a + 2 + 6
        case "A Z":
            return a + 3 + 0
        case "B X":
            return a + 1 + 0
        case "B Y":
            return a + 2 + 3
        case "B Z":
            return a + 3 + 6
        case "C X":
            return a + 1 + 6
        case "C Y":
            return a + 2 + 0
        case "C Z":
            return a + 3 + 3


def f2(a, b):
    if isinstance(a, str):  # First iteration
        return f2(f2(0, a), b)
    else:
        compare = b.rstrip()  # Strip away newline
    match compare:
        case "A X":
            return a + 3 + 0
        case "A Y":
            return a + 1 + 3
        case "A Z":
            return a + 2 + 6
        case "B X":
            return a + 1 + 0
        case "B Y":
            return a + 2 + 3
        case "B Z":
            return a + 3 + 6
        case "C X":
            return a + 2 + 0
        case "C Y":
            return a + 3 + 3
        case "C Z":
            return a + 1 + 6


if __name__ == "__main__":
    main()
