defmodule NamedNumberLists do

  def solution() do
    Enum.map(0..10, fn _ -> Enum.random(0..9) end)
    |> Enum.map(fn value ->
    case value do
      0 -> "Zero"
      1 -> "One"
      2 -> "Two"
      3 -> "Three"
      4 -> "Four"
      5 -> "Five"
      6 -> "Six"
      7 -> "Seven"
      8 -> "Eight"
      9 -> "Nine"
    end
    end)
  end
end

NamedNumberLists.solution |> IO.inspect()
