import copy
import re


def main():
    stack1 = ["H", "T", "Z", "D"]
    stack2 = ["Q", "R", "W", "T", "G", "C", "S"]
    stack3 = ["P", "B", "F", "Q", "N", "R", "C", "H"]
    stack4 = ["L", "C", "N", "F", "H", "Z"]
    stack5 = ["G", "L", "F", "Q", "S"]
    stack6 = ["V", "P", "W", "Z", "B", "R", "C", "S"]
    stack7 = ["Z", "F", "J"]
    stack8 = ["D", "L", "V", "Z", "R", "H", "Q"]
    stack9 = ["B", "H", "G", "N", "F", "Z", "L", "D"]
    stacks = [" "] + [stack1] + [stack2] + [stack3] + [stack4] + \
        [stack5] + [stack6] + [stack7] + [stack8] + [stack9]
    stackCopy = copy.deepcopy(stacks)

    lines = open("input.txt", "r").read().splitlines()[10:]
    instructions = []
    for line in lines:
        instructions += [[int(s) for s in re.findall(r'\b\d+\b', line)]]
    f1(stackCopy, instructions)
    f2(stacks, instructions)
    return


def f1(stacks, instructions):
    for i in instructions:
        for j in range(i[0]):
            stacks[i[2]] += stacks[i[1]].pop()
    print("Part 1:", end='')
    for stack in stacks:
        print(stack[-1], end='')
    print()


def f2(stacks, instructions):
    for i in instructions:
        stacks[i[2]] += stacks[i[1]][-i[0]:]
        stacks[i[1]] = stacks[i[1]][:-i[0]]
    print("Part 2:", end='')
    for stack in stacks:
        print(stack[-1], end='')
    print()


if __name__ == "__main__":
    main()
