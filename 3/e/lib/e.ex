defmodule E do
  def p1 do
    input = File.read!("../input.txt") |> String.split("\n")
    input = Enum.map(input, fn line -> String.graphemes(line)end)
    Enum.reduce(input, 0, fn line, acc1 -> acc1 +
      Enum.reduce_while(Enum.slice(line, 0..div(length(line), 2)-1), 0, fn char1, acc2 ->
        if findSame(line, char1) != 0 do
          {:halt, acc2 + findSame(line, char1)}
        else
          {:cont, acc2}
        end
      end)
    end)
  end
  def findSame(line, char1) do
    Enum.reduce_while(Enum.slice(line, div(length(line), 2)..-1),0, fn char2, acc3->
      if char1 == char2 do
        if :binary.first(char1) > 96 do
          {:halt, acc3 + :binary.first(char1) - 96}
        else
          {:halt, acc3 + :binary.first(char1) - 38}
        end
      else
        {:cont, acc3}
      end
    end)
  end
end
