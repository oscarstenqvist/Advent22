from functools import reduce


def main():
    line = open("input.txt", "r").read()
    a = input("Enter 1 for part 1, enter 2 for part 2: ")
    if a == "1":
        reduce(f1, line)
    if a == "2":
        reduce(f2, line)
    return


def f1(a, b):
    if isinstance(a, str):
        return f1(f1([0], a), b)
    if b in a:
        a.pop(1)
        return f1(a, b)
    a += b
    a[0] += 1
    if len(a) == 5:
        print("Part 1: " + str(a[0]))
        exit()
    return a


def f2(a, b):
    if isinstance(a, str):
        return f2(f2([0], a), b)
    if b in a:
        a.pop(1)
        return f2(a, b)
    a += b
    a[0] += 1
    if len(a) == 15:
        print("Part 2: " + str(a[0]))
        exit()
    return a


if __name__ == "__main__":
    main()
