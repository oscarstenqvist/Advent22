defmodule E do
  def p1 do
    input = prepInput("input.txt")
    input = Enum.max(input)
    IO.puts("Part 1: " <> Integer.to_string(input))
  end
  def p2 do
    input = prepInput("input.txt")
    output = popScoreboard(input, Enum.with_index([0,0,0]))
    output = Enum.map(output, fn(x) -> Integer.to_string(x) end)
    IO.puts("Part 2: " <> output)
  end

  def popScoreboard(input, output) do
    Enum.reduce(input, output, fn x, acc -> Enum.map(acc, fn y ->
      elem(y, 0) = if x > elem(y,0) do
        popScoreboard(elem(y, 0), Enum.slice(acc, elemn(y,1)+1..-1))
        x
      else
        elem(y,0)
      end
    end) end)
    output
  end

  def prepInput(fileName) do
    input = File.read!(fileName)
    input = String.split(input, "\n")
    input = Enum.chunk_by(input, fn(x) -> x == "" end)
    input = Enum.filter(input, fn(x) -> x != [""] end)
    input = Enum.map(input, fn(x) -> Enum.map(x, fn(y) -> String.to_integer(y) end) end)
    input = Enum.map(input, fn(x) -> Enum.sum(x) end)
  end
end
