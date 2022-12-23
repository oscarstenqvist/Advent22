defmodule E do
  def p1 do
    matrix = setup("../input.txt")
    Enum.reduce(matrix, 0, fn lineTup, lineacc ->
      {line, lineIndex} = lineTup
      lineacc + Enum.reduce(line, 0, fn treeTup, treeacc ->
        {tree, treeIndex} = treeTup

        {leftTrees, rightTrees} = Enum.split(Enum.map(line, fn x -> elem(x, 0)end), treeIndex)
        rightTrees = Enum.drop(rightTrees, 1)

        colTrees = getColTrees(matrix, treeIndex)
        {upTrees, downTrees} = Enum.split(colTrees, lineIndex)
        downTrees = Enum.drop(downTrees, 1)

        leftMax = Enum.max(leftTrees, &>=/2, fn -> -1 end)
        rightMax = Enum.max(rightTrees, &>=/2, fn -> -1 end)
        upMax = Enum.max(upTrees, &>=/2, fn -> -1 end)
        downMax = Enum.max(downTrees, &>=/2, fn -> -1 end)

        if leftMax < tree or rightMax < tree or upMax < tree or downMax < tree do
          treeacc + 1
        else
          treeacc
        end
      end)
    end)
  end

  def p2 do
    matrix = setup("../input.txt")
    Enum.reduce(matrix, 0, fn lineTup, lineacc ->
      {line, lineIndex} = lineTup
      linescore = Enum.reduce(line, 0, fn treeTup, treeacc ->
        {tree, treeIndex} = treeTup

        {leftTrees, rightTrees} = Enum.split(Enum.map(line, fn x -> elem(x, 0)end), treeIndex)
        rightTrees = Enum.drop(rightTrees, 1)

        colTrees = getColTrees(matrix, treeIndex)
        {upTrees, downTrees} = Enum.split(colTrees, lineIndex)

        downTrees = Enum.drop(downTrees, 1)
        leftTrees = Enum.reverse(leftTrees)
        upTrees = Enum.reverse(upTrees)

        currScore = countTrees(leftTrees, tree) * countTrees(rightTrees, tree) *
                    countTrees(upTrees, tree) * countTrees(downTrees, tree)
        if currScore > treeacc do
          currScore
        else
          treeacc
        end
      end)
      if linescore > lineacc do
        linescore
      else
        lineacc
      end
    end)
  end

  def countTrees(trees, height) do
    Enum.reduce_while(trees, 0, fn tree, acc ->
      if tree < height do
        {:cont, acc + 1}
      else
        {:halt, acc + 1}
      end
    end)
  end

  def getColTrees(matrix, colIndex) do
    Enum.reduce(matrix, [], fn lineTup, lineAcc ->
      {line, _} = lineTup
      Enum.concat(lineAcc, [elem(Enum.at(line, colIndex), 0)])
    end)
  end

  def setup(fileDir) do
    File.read!(fileDir)
    |>String.split("\n")
    |>Enum.map(fn line ->
      Enum.map(String.graphemes(line), fn char ->
        String.to_integer(char)
      end)
    end)
    |> Enum.map(fn x -> Enum.with_index(x)end)
    |> Enum.with_index()
  end
end
