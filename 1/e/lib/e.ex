defmodule E do
  def p1 do
    input = File.read!("input.txt")
    input = String.split(input, "\n")
    input = Enum.chunk_by(input, fn(x) -> x == "" end)
    input = Enum.filter(input, fn(x) -> x != [""] end)
    input = Enum.map(input, fn(x) -> Enum.map(x, fn(y) -> String.to_integer(y) end) end)
    input = Enum.map(input, fn(x) -> Enum.sum(x) end)
    input = Enum.max(input)
    IO.puts("Part 1: " <> Integer.to_string(input))
  end
  def p2 do
    input = File.read!("tinput.txt")
    input = String.split(input, "\n")
    input = Enum.chunk_by(input, fn(x) -> x == "" end)
    input = Enum.filter(input, fn(x) -> x != [""] end)
    input = Enum.map(input, fn(x) -> Enum.map(x, fn(y) -> String.to_integer(y) end) end)
    input = Enum.map(input, fn(x) -> Enum.sum(x) end)
    input = Enum.reduce(input, [0,0,0], fn x, acc ->
      if x > acc[0], do: acc = [x,acc[0],acc[1]], else: if x > acc[1], do: acc = [acc[0], x, acc[1]], else:
      if x > acc[2], do: acc = [acc[0], acc[1], x]
    end) #Not working
    IO.puts("Part 2: " <> Integer.to_string(input))
  end
end
