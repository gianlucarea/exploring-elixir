defmodule GamesTest do
  use ExUnit.Case
  doctest Games

  test "greets the world" do
    assert Games.hello() == :world
  end
end

defmodule WordleTest do
  use ExUnit.Case

  test "all letters are green" do
    assert Games.Wordle.test_feedback("apple", "apple") == [:green, :green, :green, :green, :green]
  end

  test "all letters are yellow" do
    assert Games.Wordle.test_feedback("elapp", "apple") == [:yellow, :yellow, :yellow, :yellow, :yellow]
  end

  test "all letters are grey" do
    assert Games.Wordle.test_feedback("house", "tarty") == [:grey, :grey, :grey, :grey, :grey]
  end

  test "some letters are green, yellow, and grey" do
    assert Games.Wordle.test_feedback("tarts", "beats") == [:grey, :grey, :yellow, :green, :green]
  end
end
