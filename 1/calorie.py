file = open("input.txt", "r")
lines = file.readlines()

elfCurrCal = elf1Cal = elf2Cal = elf3Cal = 0

for line in lines:
    if line != "\n":
        elfCurrCal += int(line)
    else:
        if elfCurrCal > elf1Cal:  # Current elf has most calories
            elf2Cal = elf1Cal  # Move previous elf with most calories to second most
            elf1Cal = elfCurrCal
        elif elfCurrCal > elf2Cal:  # Current elf has second most calories
            elf3Cal = elf2Cal  # Move previous elf with second most to third most
            elf2Cal = elfCurrCal
        elif elfCurrCal > elf3Cal:  # Current elf has third most calories
            elf3Cal = elfCurrCal
        elfCurrCal = 0
print("Calories of top elf: " + str(elf1Cal))
print("Calories of top 3 elfs: " + str(elf1Cal + elf2Cal + elf3Cal))
