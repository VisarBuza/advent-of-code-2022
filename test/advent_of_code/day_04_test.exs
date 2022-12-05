defmodule AdventOfCode.Day04Test do
  use ExUnit.Case

  import AdventOfCode.Day04

  @tag :skip
  test "part1" do
    input = AdventOfCode.Input.get!(4)
    result = part1(input)

    assert result = 448
  end

  @tag :skip
  test "part2" do
    input = AdventOfCode.Input.get!(4)
    result = part2(input)

    assert result = 794
  end
end
