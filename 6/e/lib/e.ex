defmodule E do
  def p1 do
    input = File.read!("../input.txt")
    |> String.graphemes()
    Enum.reduce_while(input, {[], 0}, fn char, acc ->
      {seq, index} = acc
      if length(seq) < 4 do
        seq = seq ++ [char]
        index = index + 1
        if length(Enum.uniq(seq)) == length(seq) do
          {:cont, {seq, index}}
        else
          {:cont, {Enum.drop(seq, 1), index}}
        end
      else
        {:halt, index}
      end
    end)
  end
end
