defmodule E do
  def p1 do
    elfTupleList = makeElfMapSets()
    Enum.reduce(elfTupleList, 0, fn elfTup, acc ->
      if MapSet.subset?(elem(elfTup, 0), elem(elfTup, 1)) or
      MapSet.subset?(elem(elfTup, 1), elem(elfTup, 0)) do
        acc + 1
      else
        acc
      end
    end)
  end

  def p2 do
    elfTupleList = makeElfMapSets()
    Enum.reduce(elfTupleList, 0, fn elfTup, acc ->
      if Enum.count(MapSet.intersection(elem(elfTup, 0), elem(elfTup, 1))) > 0 do
        acc + 1
      else
        acc
      end
    end)
  end

  def makeElfMapSets do
    input = File.read!("../input.txt")
    |> String.split("\n")
    |> Enum.map(fn line ->
      line = String.split(line, ["-", ","])
      line = Enum.map(line, fn char ->
        String.to_integer(char)
      end)
      elf1Start = Enum.at(line, 0)
      elf1End = Enum.at(line, 1)
      elf2Start = Enum.at(line, 2)
      elf2End = Enum.at(line, 3)
      {MapSet.new(elf1Start..elf1End), MapSet.new(elf2Start..elf2End)}
    end)
  end
end
