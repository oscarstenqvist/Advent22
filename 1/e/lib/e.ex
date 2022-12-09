defmodule E do
  def p1 do
    max = prepInput("input.txt") |> Enum.max() |> Integer.to_string()
    IO.puts("Part 1: " <> max)
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
    File.read!(fileName) |> String.split("\n") |> Enum.chunk_by(fn(x) -> x == "" end) |>
    Enum.filter(fn(x) -> x != [""] end) |>
    Enum.map(fn(x) -> Enum.map(x, fn(y) -> String.to_integer(y) end) end) |>
    Enum.map(fn(x) -> Enum.sum(x) end)
  end
end
