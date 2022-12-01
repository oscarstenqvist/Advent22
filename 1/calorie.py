file = open("input.txt", "r")
lines = file.readlines()

elfList = [0]*len(lines)
elfIndex = 0
elf1Cal = 0
elf2Cal = 0
elf3Cal = 0

for line in lines:
    if line == "" or line == "\n":
        if elfList[elfIndex] > elf1Cal:
            elf2Cal = elf1Cal
            elf1Cal = elfList[elfIndex]
        elif elfList[elfIndex] > elf2Cal:
            elf3Cal = elf2Cal
            elf2Cal = elfList[elfIndex]
        elif elfList[elfIndex] > elf3Cal:
            elf3Cal = elfList[elfIndex]
        elfIndex += 1
        continue
    calorie = int(line)
    elfList[elfIndex] += calorie
print(elf1Cal + elf2Cal + elf3Cal)
