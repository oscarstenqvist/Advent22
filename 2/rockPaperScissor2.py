elfRock = "A"
elfPaper = "B"
elfScissor = "C"

meLose = "X"
meDraw = "Y"
meWin = "Z"

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
    currScore = 0
    if meInput == meLose:
        currScore += scoreLost
        if elfInput == elfRock:
            currScore += scoreScissor
        elif elfInput == elfPaper:
            currScore += scoreRock
        elif elfInput == elfScissor:
            currScore += scorePaper
    elif meInput == meDraw:
        currScore += scoreDraw
        if elfInput == elfRock:
            currScore += scoreRock
        elif elfInput == elfPaper:
            currScore += scorePaper
        elif elfInput == elfScissor:
            currScore += scoreScissor
    elif meInput == meWin:
        currScore += scoreWin
        if elfInput == elfRock:
            currScore += scorePaper
        elif elfInput == elfPaper:
            currScore += scoreScissor
        elif elfInput == elfScissor:
            currScore += scoreRock
    totalScore += currScore
print("Totalscore is: " + str(totalScore))
