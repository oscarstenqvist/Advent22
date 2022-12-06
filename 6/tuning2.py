import re


def main():
    line = open("input.txt", "r").read()
    print("Part 1: ", str(part(line, 4)))
    print("Part 2: ", str(part(line, 14)))
    return


def part(line, ammount):
    i = 0
    while i < len(line):
        j = 0
        found = False
        while j < ammount-1:
            if len(re.findall(line[i + j], line[i:i+ammount])) > 1:
                found = True
                break
            j += 1
        if not found:
            return i + ammount
        i += 1


if __name__ == "__main__":
    main()
