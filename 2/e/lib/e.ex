defmodule E do
  def p1 do
    File.read!("input.txt") |> String.split("\n") |> getScore()
  end
  def p2 do
    File.read!("input.txt") |> String.split("\n") |>
    Enum.map(fn x ->
      case x do
        "A X" -> "A Z"
        "A Y" -> "A X"
        "A Z" -> "A Y"
        "B X" -> "B X"
        "B Y" -> "B Y"
        "B Z" -> "B Z"
        "C X" -> "C Y"
        "C Y" -> "C Z"
        "C Z" -> "C X"
      end
    end) |> getScore()
  end
  def getScore(input) do
    Enum.reduce(input, 0, fn x, acc ->
      case x do
        "A X" -> acc + 1 + 3
        "A Y" -> acc + 2 + 6
        "A Z" -> acc + 3 + 0
        "B X" -> acc + 1 + 0
        "B Y" -> acc + 2 + 3
        "B Z" -> acc + 3 + 6
        "C X" -> acc + 1 + 6
        "C Y" -> acc + 2 + 0
        "C Z" -> acc + 3 + 3
      end
    end)
  end
end
