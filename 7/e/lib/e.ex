defmodule E do
  def p1 do
    lines = File.read!("../tinput.txt")
    |> String.split("\n")
    |> Enum.map(fn line -> String.graphemes(line)end)
    adjMatrix = Enum.reduce(lines, {[], nil, 0}, fn line, acc ->
      {matrix, cwd, cwdIndex} = acc
      acc = case Enum.at(line, 0) do
        "$" ->
          case Enum.at(line, 2) do
            "c" ->
              case Enum.at(line, 5) do
                "." ->
                  cwdMatrix = Enum.at(matrix, cwdIndex)
                  Enum.map(cwdMatrix, fn x -> IO.puts(x)end)
                  {matrix, Enum.at(cwdMatrix, 1), findDirIndex(matrix, Enum.at(cwdMatrix, 2))}
                _ ->
                  {_, dirName} = Enum.split(line, 5)
                  {matrix ++ [[0, cwd, dirName]], Enum.at(dirName, 0), length(matrix)}
              end
            "l" ->
              acc
            _ ->
        end
        "d" ->
          {_, dirName} = Enum.split(line, 4)
          matrix = List.replace_at(matrix, cwdIndex, Enum.at(matrix, cwdIndex) ++ [dirName])
          {matrix, cwd, cwdIndex}
        _ ->
          currNum = convertCharInt(line)
          prevNum = Enum.at(Enum.at(matrix, cwdIndex), 0)
          size = currNum + prevNum
          prevLine = Enum.at(matrix, cwdIndex)
          prevLine = List.replace_at(prevLine, 0, size)
          matrix = List.replace_at(matrix, cwdIndex, prevLine)
          {matrix, cwd, cwdIndex}
      end
    end)
    matrix = elem(adjMatrix, 0)
    '''
    totalMatrix = Enum.map(matrix,fn dir ->
      size = Enum.at(dir, 0)
      bdir = Enum.slice(dir, 2..-1)
      totalSize = Enum.reduce(bdir, size, fn dirN, acc2 ->
        #need to look at each dir in dirN recursivly
        acc2 + Enum.at(Enum.find(matrix, 0, fn x -> Enum.at(x, 1) == dirN end), 0)
      end)
      List.replace_at(dir, 0, totalSize)
    end)
    '''
    Enum.reduce(matrix, 0, fn dir, acc ->
      dirIndex = findDirIndex(matrix, Enum.at(dir, 2))
      IO.puts(dirIndex)
      size = recSize(matrix, dirIndex)
      if size < 100000 do
        acc + size
      else
        acc
      end
    end)
  end
  def recSize(matrix, dirIndex) do
    dir = Enum.at(matrix, dirIndex)
    subdir = Enum.slice(dir, 3..-1)
    Enum.map(subdir, fn x -> IO.puts(x)end)
    IO.puts("")
    startSize = Enum.at(dir, 0)
    size = startSize + Enum.reduce(subdir, 0, fn subsubdir, acc ->
      index = findDirIndex(matrix, subsubdir)
      acc + recSize(matrix, index)
      end)
  end

  def findDirIndex(matrix, dirName) do
    Enum.find_index(matrix, fn x -> Enum.at(x, 1) == dirName end)
  end
  def convertCharInt(line) do
    num = elem(Enum.split(line, Enum.find_index(line, fn x -> x == " " end)), 0)
    {num, _} = Enum.reduce(Enum.reverse(num), {0, 0}, fn x, acc ->
      {d, pow} = acc
      {d + Integer.pow(10, pow) * elem(Integer.parse(x), 0), pow+1}
    end)
    num
  end
end
