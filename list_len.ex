#Recursive calculate the lenght of a list
defmodule ListHelper do
  def calcola(length,[]) do
     IO.puts(length)
  end

  def calcola(length,[_ | tail]) do
    new_length = length + 1
    calcola(new_length, tail)
  end
end
ListHelper.calcola(0,[1,2,3,4,5,6,7,8,9,10])
