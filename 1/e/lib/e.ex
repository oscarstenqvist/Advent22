defmodule E do
  def main do
    input = File.read!("input.txt")
    input = String.split(input, "\n")
    input = Enum.chunk_by(input, fn(x) -> x == "" end)
    input = Enum.filter(input, fn(x) -> x != [""] end)
    input = Enum.map(input, fn(x) -> Enum.map(x, fn(y) -> String.to_integer(y) end) end)
    input = Enum.map(input, fn(x) -> Enum.sum(x) end)
    input = Enum.max(input)
    IO.puts(input)
  end
end
