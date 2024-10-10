defmodule NamingNumbers do

  def naming_10_numbers(param \\ 0)do
    case param do
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
  end


  def naming_10_numbers_Ab(param \\ "zero") do
    case param do
      "zero" -> 0
      "one" -> 1
      "two" -> 2
      "three" -> 3
      "four" -> 4
      "five" -> 5
      "six" -> 6
      "seven" -> 7
      "eight" -> 8
      "nine" -> 9
      "Zero" -> 0
      "One" -> 1
      "Two" -> 2
      "Three" -> 3
      "Four" -> 4
      "Five" -> 5
      "Six" -> 6
      "Seven" -> 7
      "Eight" -> 8
      "Nine" -> 9
    end
  end
end


NamingNumbers.naming_10_numbers(5) |> IO.inspect()
NamingNumbers.naming_10_numbers_Ab("Eight") |> IO.inspect()
NamingNumbers.naming_10_numbers_Ab() |> IO.inspect()
