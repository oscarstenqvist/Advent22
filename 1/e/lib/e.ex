defmodule E do
  def p1 do
    input = prepInput("input.txt")
    input = Enum.max(input)
    IO.puts("Part 1: " <> Integer.to_string(input))
  end
  def p2 do
    input = prepInput("input.txt")
    max1 = Enum.max(input)
    input = Enum.reject(input, fn x -> x == max1 end)
    max2 = Enum.max(input)
    input = Enum.reject(input, fn x -> x == max2 end)
    max3 = Enum.max(input)
    IO.puts("Part 2: " <> Integer.to_string(max1+max2+max3))
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
