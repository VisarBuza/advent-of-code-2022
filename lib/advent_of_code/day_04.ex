defmodule AdventOfCode.Day04 do
  def part1(_args) do
    AdventOfCode.Input.get!(4)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.split(&1, ",", trim: true))
    |> Enum.map(fn x -> x |> Enum.map(&parse_map(&1)) end)
    |> Enum.filter(&contains_range?(&1))
    |> Enum.count()
  end

  def part2(_args) do
    AdventOfCode.Input.get!(4)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.split(&1, ",", trim: true))
    |> Enum.map(fn x -> x |> Enum.map(&parse_range(&1)) end)
    |> Enum.filter(fn [range1, range2] -> !Range.disjoint?(range1, range2) end)
    |> Enum.count()
  end

  defp contains_range?([range1, range2]) do
    (range1.lower >= range2.lower and range1.upper <= range2.upper) or
      (range2.lower >= range1.lower and range2.upper <= range1.upper)
  end

  defp parse_range(string) do
    [lower, upper] = String.split(string, "-", trim: true)
    Range.new(String.to_integer(lower), String.to_integer(upper))
  end

  defp parse_map(string) do
    [lower, upper] = String.split(string, "-", trim: true)
    %{:lower => String.to_integer(lower), :upper => String.to_integer(upper)}
  end
end
