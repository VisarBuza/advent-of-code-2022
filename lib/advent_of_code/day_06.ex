defmodule AdventOfCode.Day06 do
  def part1(_args) do
    input =
      AdventOfCode.Input.get!(6)
      |> String.split("", trim: true)
      |> Enum.chunk_every(4, 1, :discard)

    { _, index } =
      input
      |> Enum.zip(0..length(input))
      |> Enum.filter(fn {chars, _} -> length(chars) == MapSet.new(chars) |> MapSet.size end)
      |> List.first()

    index + 4
  end

  def part2(_args) do
    input =
      AdventOfCode.Input.get!(6)
      |> String.split("", trim: true)
      |> Enum.chunk_every(14, 1, :discard)

    {_, index} =
      input
      |> Enum.zip(0..length(input))
      |> Enum.filter(fn {chars, _} -> length(chars) == MapSet.new(chars) |> MapSet.size end)
      |> List.first()

    index + 14
  end
end
