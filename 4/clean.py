from functools import reduce
import re


def main():
    lines = open("input.txt", "r").read().splitlines()
    elfRoomPairs = []
    for line in lines:
        index1 = re.search("-", line).start()
        index2 = re.search(",", line).start()
        index3 = re.search("-", line[index1 + 1:]).start() + index1 + 1
        elf1Start = int(line[0:index1])
        elf1End = int(line[index1 + 1:index2])
        elf2Start = int(line[index2 + 1:index3])
        elf2End = int(line[index3 + 1:])
        elf1rooms = set(range(elf1Start, elf1End+1))
        elf2rooms = set(range(elf2Start, elf2End + 1))
        elfRoomPairs.append([elf1rooms, elf2rooms])
    print("Part 1: " + str(reduce(f1, elfRoomPairs)))
    print("Part 2: " + str(reduce(f2, elfRoomPairs)))
    return


def f1(a, b):
    if isinstance(a, list):
        return f1(f1(0, a), b)
    intersect = b[0].intersection(b[1])
    if (len(intersect) == len(b[0])) | (len(intersect) == len(b[1])):
        return a + 1
    return a


def f2(a, b):  # TODO fix
    if isinstance(a, list):
        return f1(f1(0, a), b)
    if len(b[0].intersection(b[1])):
        return a + 1
    return a


if __name__ == "__main__":
    main()
