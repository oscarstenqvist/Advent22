defmodule E do
  def p1 do
    elfTupleList = makeElfMapSets()
    Enum.reduce(elfTupleList, 0, fn elfTup, acc ->
      {elf1Set, elf2Set} = elfTup
      if MapSet.subset?(elf1Set, elf2Set) or
      MapSet.subset?(elf2Set, elf1Set) do
        acc + 1
      else
        acc
      end
    end)
  end

  def p2 do
    elfTupleList = makeElfMapSets()
    Enum.reduce(elfTupleList, 0, fn elfTup, acc ->
      {elf1Set, elf2Set} = elfTup
      if Enum.count(MapSet.intersection(elf1Set, elf2Set)) > 0 do
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
      [elf1Start, elf1End, elf2Start, elf2End] = line
      {MapSet.new(elf1Start..elf1End), MapSet.new(elf2Start..elf2End)}
    end)
  end
end
