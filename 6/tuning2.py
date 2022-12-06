def main():
    line = open("input.txt", "r").read()
    print("Part 1: ", str(tuning(line, 4)))
    print("Part 2: ", str(tuning(line, 14)))
    return


def tuning(line, ammount):
    for i in range(len(line)):
        charCount = 0
        substring = line[i:i+ammount]
        for char in substring:
            charCount += substring.count(char)
        if charCount <= ammount:
            return i + ammount


if __name__ == "__main__":
    main()
