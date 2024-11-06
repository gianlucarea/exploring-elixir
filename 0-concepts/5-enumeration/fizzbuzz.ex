defmodule FizzBuzz do

  def run(range) do
    Enum.map(range, fn value ->
      cond do
       rem(value,3) == 0  and rem(value,5) == 0 -> "fizzbuz"
       rem(value,3) == 0 -> "fizz"
       rem(value,5) == 0 -> "buzz"
       true -> value
      end

    end)

  end

end

FizzBuzz.run(1..15) |> IO.inspect()
