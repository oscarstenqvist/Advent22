defmodule E do
  def p1 do
    {stacks, lines}  = setup()
    stacks = Enum.reduce(lines, stacks, fn line, acc ->
      [moveAmmount, reduceIndex, increaseIndex] = line
      Enum.reduce(1..moveAmmount, acc, fn _, acc2 ->
        reduceStack = Enum.at(acc2, reduceIndex)
        increaseStack = Enum.at(acc2, increaseIndex)
        {reducePop, reduceStack} = List.pop_at(reduceStack, -1)
        increaseStack = increaseStack ++ [reducePop]
        acc2 = List.replace_at(acc2, reduceIndex, reduceStack)
        List.replace_at(acc2, increaseIndex, increaseStack)
      end)
    end)
    Enum.map(stacks, fn stack ->
      IO.write(Enum.at(stack, -1))
    end)
  end

  def p2 do
    {stacks, lines} = setup()
    stacks = Enum.reduce(lines, stacks, fn line, acc ->
      [moveAmmount, reduceIndex, increaseIndex] = line
      reduceStack = Enum.at(acc, reduceIndex)
      increaseStack = Enum.at(acc, increaseIndex)
      {reduceStack, reduceSplit} = Enum.split(reduceStack, length(reduceStack)-moveAmmount)
      increaseStack = increaseStack ++ reduceSplit
      acc = List.replace_at(acc, reduceIndex, reduceStack)
      List.replace_at(acc, increaseIndex, increaseStack)
    end)
    Enum.map(stacks, fn stack ->
      IO.write(Enum.at(stack, -1))
    end)
  end

  def setup do
    stack0 = []
    stack1 = ["H", "T", "Z", "D"]
    stack2 = ["Q", "R", "W", "T", "G", "C", "S"]
    stack3 = ["P", "B", "F", "Q", "N", "R", "C", "H"]
    stack4 = ["L", "C", "N", "F", "H", "Z"]
    stack5 = ["G", "L", "F", "Q", "S"]
    stack6 = ["V", "P", "W", "Z", "B", "R", "C", "S"]
    stack7 = ["Z", "F", "J"]
    stack8 = ["D", "L", "V", "Z", "R", "H", "Q"]
    stack9 = ["B", "H", "G", "N", "F", "Z", "L", "D"]
    stacks = [stack0, stack1, stack2, stack3, stack4, stack5, stack6,
              stack7, stack8, stack9]
    lines = File.read!("../input.txt")
    |>String.split("\n")
    |>Enum.slice(10..-1)
    |>Enum.map(fn line ->
      String.split(line, ["move ", " from ", " to "], trim: true)
      |>Enum.map(fn char ->
        String.to_integer(char)
      end)
    end)
    {stacks, lines}
  end
end
