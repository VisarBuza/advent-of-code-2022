defmodule AdventOfCode.Day01 do
  def part1(_args) do
    input = AdventOfCode.Input.get!(1)

    input
    |> String.split("\n\n")
    |> Enum.map(&String.split(&1, "\n"))
    |> Enum.map(fn elf ->
      elf
      |> Enum.filter(fn calories -> calories != "" end)
      |> Enum.map(&String.to_integer/1)
      |> Enum.sum()
    end)
    |> Enum.max()
  end

  def part2(_args) do
    input = AdventOfCode.Input.get!(1)

    input
    |> String.split("\n\n")
    |> Enum.map(&String.split(&1, "\n"))
    |> Enum.map(fn elf ->
      elf
      |> Enum.filter(fn calories -> calories != "" end)
      |> Enum.map(&String.to_integer/1)
      |> Enum.sum()
    end)
    |> Enum.sort(fn a, b -> a > b end)
    |> Enum.take(3)
    |> Enum.sum()
  end
end
