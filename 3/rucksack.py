from functools import reduce


def main():
    lines = open("input.txt", "r").read().splitlines()
    print("Part 1: " + str(reduce(f1, lines)))
    print("Part 2: " + str(f2(lines)))
    return


def f1(a, b):
    if isinstance(a, str):
        return f1(f1(0, a), b)
    for char1 in b[:(int(len(b)/2))]:
        for char2 in b[int(len(b)/2):]:
            if char1 == char2:
                if ord(char1) < ord("a"):
                    return a + ord(char1) - ord("A") + 27
                else:
                    return a + ord(char1) - ord("a") + 1


def f2(lines):
    if len(lines) < 3:
        return 0
    r1 = lines[0]
    r2 = lines[1]
    r3 = lines[2]
    for char1 in r1:
        for char2 in r2:
            for char3 in r3:
                if char1 == char2 == char3:
                    if ord(char1) < ord("a"):
                        return ord(char1) - ord("A") + 27 + f2(lines[3:])
                    else:
                        return ord(char1) - ord("a") + 1 + f2(lines[3:])


if __name__ == "__main__":
    main()
