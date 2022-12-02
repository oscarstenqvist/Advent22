elfRock = "A"
elfPaper = "B"
elfScissor = "C"

meRock = "X"
mePaper = "Y"
meScissor = "Z"

scoreRock = 1
scorePaper = 2
scoreScissor = 3

scoreWin = 6
scoreDraw = 3
scoreLost = 0

file = open("input.txt", "r")
lines = file.readlines()
totalScore = 0
for line in lines:
    elfInput = line[0]
    meInput = line[2]
    currScore = ord(meInput)-(ord(meRock)-1)

    if meInput == meRock:
        if elfInput == elfRock:
            currScore += scoreDraw
        elif elfInput == elfPaper:
            currScore += scoreLost
        elif elfInput == elfScissor:
            currScore += scoreWin
    elif meInput == mePaper:
        if elfInput == elfRock:
            currScore += scoreWin
        elif elfInput == elfPaper:
            currScore += scoreDraw
        elif elfInput == elfScissor:
            currScore += scoreLost
    elif meInput == meScissor:
        if elfInput == elfRock:
            currScore += scoreLost
        elif elfInput == elfPaper:
            currScore += scoreWin
        elif elfInput == elfScissor:
            currScore += scoreDraw
    totalScore += currScore
print("Totalscore is: " + str(totalScore))
