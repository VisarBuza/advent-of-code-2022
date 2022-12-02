defmodule AdventOfCode.Day02 do
  def part1(_args) do
    input = AdventOfCode.Input.get!(2, 2022)

    mapping = %{
      "X" => :rock,
      "Y" => :paper,
      "Z" => :scissors,
      "A" => :rock,
      "B" => :paper,
      "C" => :scissors
    }

    input
    |> String.split("\n")
    |> Enum.filter(fn line -> line != "" end)
    |> Enum.map(&(String.trim(&1) |> String.split(" ")))
    |> Enum.map(fn [first, second] -> [mapping[first], mapping[second]] end)
    |> Enum.map(&calculateScore(&1))
    |> Enum.sum()
  end

  def part2(_args) do
    input = AdventOfCode.Input.get!(2, 2022)

    mapping = %{
      "X" => :rock,
      "Y" => :paper,
      "Z" => :scissors,
      "A" => :rock,
      "B" => :paper,
      "C" => :scissors
    }

    input
    |> String.split("\n")
    |> Enum.filter(fn line -> line != "" end)
    |> Enum.map(&(String.trim(&1) |> String.split(" ")))
    |> Enum.map(&selectMove(&1, mapping))
    |> Enum.map(&calculateScore(&1))
    |> Enum.sum()
  end

  defp selectMove([opponent, me], mapping) do
    lose = %{
      :rock => :paper,
      :paper => :scissors,
      :scissors => :rock
    }

    win = Enum.map(lose, fn {k, v} -> {v, k} end)

    case me do
      "X" -> [mapping[opponent], win[mapping[opponent]]]
      "Y" -> [mapping[opponent], mapping[opponent]]
      "Z" -> [mapping[opponent], lose[mapping[opponent]]]
      _ -> 0
    end
  end

  defp calculateScore([oponnent, me]) do
    score = %{:rock => 1, :paper => 2, :scissors => 3}
    score[me] +
      case [oponnent, me] do
        [:rock, :rock] -> 3
        [:paper, :paper] -> 3
        [:scissors, :scissors] -> 3
        [:rock, :paper] -> 6
        [:paper, :scissors] -> 6
        [:scissors, :rock] -> 6
        _ -> 0
      end
  end
end
