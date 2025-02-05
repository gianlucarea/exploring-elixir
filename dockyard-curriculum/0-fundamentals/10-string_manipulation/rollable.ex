defmodule Rollable do
  def replace(string) do
    Regex.replace(~r/(\d+)d(\d+)/, string, fn full, dice, sides ->
      "[#{full}](https://www.google.com/search?q=roll+#{dice}d#{sides})"
    end)
  end

  def roll(string) do
    Regex.replace(~r/(\d+)d(\d)+/, string, fn _full, dice, sides ->
      dice_integer = String.to_integer(dice)
      sides_integer = String.to_integer(sides)

      _value =
        1..dice_integer
        |> Enum.map(fn _ -> Enum.random(1..sides_integer) end)
        |> Enum.sum()
        |> Integer.to_string()
    end)
  end
end

Rollable.replace("1d4") |> IO.inspect()
Rollable.roll("Fireball: deal 8d6 fire damage.") |> IO.inspect()
