from functools import reduce
import re

count = 0


def main():
    lines = open("input.txt", "r").read().splitlines()
    elfRoomPairs = []
    for line in lines:
        digits = [int(s) for s in re.findall(r'\b\d+\b', line)]
        elf1rooms = set(range(digits[0], digits[1]+1))
        elf2rooms = set(range(digits[2], digits[3]+1))
        elfRoomPairs.append([elf1rooms, elf2rooms])
    print("Part 1: " + str(reduce(f1, elfRoomPairs)))
    print("Part 2: " + str(reduce(f2, elfRoomPairs)))
    return


def f1(a, b):
    if isinstance(a, list):
        return f1(f1(0, a), b)
    intersect = b[0].intersection(b[1])
    if len(intersect) in (len(b[0]), len(b[1])):
        return a + 1
    return a


def f2(a, b):
    if isinstance(a, list):
        return f2(f2(0, a), b)
    if len(b[0].intersection(b[1])):
        return a + 1
    return a


if __name__ == "__main__":
    main()
