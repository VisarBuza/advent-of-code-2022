defmodule AdventOfCode.Day03 do
  def part1(_args) do
    AdventOfCode.Input.get!(3)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&split_string(&1))
    |> Enum.reduce([], fn x, acc -> acc ++ find_intersection(x) end)
    |> Enum.reduce(0, fn x, acc -> acc + calculate_priority(x) end)
  end

  def part2(_args) do
    AdventOfCode.Input.get!(3)
    |> String.trim()
    |> String.split("\n")
    |> Enum.chunk_every(3)
    |> Enum.reduce([], fn x, acc -> acc ++ find_intersection(x) end)
    |> Enum.reduce(0, fn x, acc -> acc + calculate_priority(x) end)
  end

  defp find_intersection([first, second]) do
    first = String.split(first, "", trim: true)
    second = String.split(second, "", trim: true)
    first
    |> Enum.filter(fn x -> Enum.member?(second, x) end)
    |> Enum.uniq()
  end

  defp find_intersection([first, second, third]) do
    third = String.split(third, "", trim: true)
    find_intersection([first, second])
    |> Enum.filter(fn x -> Enum.member?(third, x) end)
    |> Enum.uniq()
  end

  defp calculate_priority(char) do
    if String.upcase(char) == char do
      <<v::utf8>> = char
      v - 38
    else
      <<v::utf8>> = char
      v - 96
    end
  end

  defp split_string(string) do
    length = String.length(string)
    mid = div(length, 2)
    [String.slice(string, 0, mid), String.slice(string, mid, length)]
  end
end
