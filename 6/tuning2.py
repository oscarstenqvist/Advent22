def main():
    line = open("input.txt", "r").read()
    print("Part 1: ", str(tuning(line, 4)))
    print("Part 2: ", str(tuning(line, 14)))
    return


def tuning(line, ammount):
    for i in range(len(line)):
        count = 0
        substring = line[i:i+ammount]
        for j in substring:
            count += substring.count(j)
        if count == ammount:
            return i + ammount


if __name__ == "__main__":
    main()
