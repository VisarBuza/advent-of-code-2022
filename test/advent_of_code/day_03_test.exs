defmodule AdventOfCode.Day03Test do
  use ExUnit.Case

  import AdventOfCode.Day03

  @tag :skip
  test "part1" do
    input = AdventOfCode.Input.get!(3)
    result = part1(input)

    assert result = 8088
  end

  @tag :skip
  test "part2" do
    input = AdventOfCode.Input.get!(3)
    result = part2(input)

    assert result = 2522
  end
end
