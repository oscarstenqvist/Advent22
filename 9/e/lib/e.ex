defmodule E do
  def p1 do
    input = setup("../input.txt")
    a = Enum.reduce(input, {[], {0,0}, {0,0}}, fn line, acc ->
      {dir, ammount} = line
      Enum.reduce(1..ammount, acc, fn _, acc2 ->
        move(acc2, dir)
      end)
    end)
    length(elem(a, 0))
  end

  def p2 do
    input = setup("../input.txt")
    a = Enum.reduce(input, {[], {0,0}, {0,0}}, fn line, acc ->
      {dir, ammount} = line
      Enum.reduce(1..ammount, acc, fn _, acc2 ->
        move(acc2, dir)
      end)
    end)
    length(elem(a, 0))
  end

  def move(acc, dir) do
    {tailVisits, {tailX, tailY}, {headX, headY}} = acc
    {headX, headY} = case dir do
      "L" ->
        {headX - 1, headY}
      "R" ->
        {headX + 1, headY}
      "U" ->
        {headX, headY - 1}
      "D" ->
        {headX, headY + 1}
    end
    dX = headX-tailX
    dY = headY-tailY
    {tailX, tailY} = case dX do
      -2 ->
        case dY do
          y when y < 0 ->
            {tailX-1, tailY-1}
          0 ->
            {tailX-1, tailY}
          y when y > 0 ->
            {tailX-1, tailY+1}
        end
      -1 ->
        case dY do
          -2 ->
            {tailX-1, tailY-1}
          2 ->
            {tailX-1, tailY+1}
          _ ->
            {tailX, tailY}
        end
      0 ->
        case dY do
          -2 ->
            {tailX, tailY-1}
          2 ->
            {tailX, tailY+1}
          _ ->
            {tailX, tailY}
        end
      1 ->
        case dY do
          -2 ->
            {tailX+1, tailY-1}
          2 ->
            {tailX+1, tailY+1}
          _ ->
            {tailX, tailY}
        end
      2 ->
        case dY do
          y when y < 0 ->
            {tailX+1, tailY-1}
          0 ->
            {tailX+1, tailY}
          y when y > 0 ->
            {tailX+1, tailY+1}
        end
    end
    tailVisits = if not Enum.member?(tailVisits, {tailX, tailY}) do
      [{tailX, tailY} | tailVisits]
    else
      tailVisits
    end
    {tailVisits, {tailX, tailY}, {headX, headY}}
  end
  def setup(fileDir) do
    File.read!(fileDir)
    |>String.split("\n")
    |>Enum.map(fn line ->
      line = List.to_tuple(String.split(line))
      {elem(line, 0), String.to_integer(elem(line, 1))}
    end)
  end
end
