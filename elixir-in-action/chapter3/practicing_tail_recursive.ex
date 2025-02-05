defmodule Chapter3Practicing do

  #Recursive calculate the lenght of a list
  def calcola([]) do
    0
  end

  def calcola([_ | tail]) do
     1 + calcola(tail)
  end

  # range /2 function that takes two integers from and to
  # and returns a list of all numbers in a given range

  def range(from, to) when from > to do
    []
  end

  def range(from, to) do
    [from | range(from + 1 , to)]
  end

  # positive/1 function that takes a list and returns
  # another list that contains only positive numbers
  # from the input list

  #Final case
  def positive([]), do: []

  #Positive
  def positive([head | tail]) when head > 0 do
    [head, positive(tail)]
  end

  #Negative
  def positive([_ | tail]) do
    positive(tail)
  end

end

Chapter3Practicing.calcola([1,2,3,4,5,6,7,8,9,10]) |> IO.puts()
Chapter3Practicing.range(2,10) |> IO.inspect()
Chapter3Practicing.range(-5,5) |> Chapter3Practicing.positive() |> IO.inspect()
