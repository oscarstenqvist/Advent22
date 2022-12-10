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
  def p2 do
    input = File.read!("../input.txt") |> String.split("\n") |>
    Enum.map(fn line -> String.graphemes(line)end) |> Enum.chunk_every(3)
    Enum.reduce(input, 0, fn chunk, acc ->
      set1 = MapSet.new(Enum.at(chunk, 0))
      set2 = MapSet.new(Enum.at(chunk, 1))
      set3 = MapSet.new(Enum.at(chunk, 2))
      intersect1 = MapSet.intersection(set1, set2)
      intersect2 = MapSet.intersection(intersect1, set3)
      sameAscii = :binary.first(Enum.at(MapSet.to_list(intersect2), 0))
      if sameAscii > 96 do
        acc + sameAscii - 96
      else
        acc + sameAscii - 38
      end
    end)
  end
end
