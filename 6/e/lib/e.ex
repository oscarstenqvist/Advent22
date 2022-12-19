defmodule E do
  def p1 do
    p(4)
  end

  def p2 do
    p(14)
  end

  def p(count) do
    input = File.read!("../input.txt")
    |> String.graphemes()
    Enum.reduce_while(input, {[], 0}, fn char, acc ->
      {seq, index} = acc
      if length(seq) < count do
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
