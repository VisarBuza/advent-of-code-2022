defmodule AdventOfCode.Day02Test do
  use ExUnit.Case

  import AdventOfCode.Day02

  @tag :skip
  test "part1" do
    input = input = AdventOfCode.Input.get!(2, 2022)
    result = part1(input)

    assert result = 11841
  end

  @tag :skip
  test "part2" do
    input = input = AdventOfCode.Input.get!(2, 2022)
    result = part2(input)

    assert result = 13022
  end
end
