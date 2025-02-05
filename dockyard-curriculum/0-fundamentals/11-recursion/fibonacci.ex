defmodule Fibonacci do
  @moduledoc """
  Documentation for the `Fibonacci` module.
  """

  @doc """
  Generate the nth fibonacci number.

  ## Examples

    iex> Fibonacci.of(0)
    0

    iex> Fibonacci.of(1)
    1

    iex> Fibonacci.of(2)
    1

    iex> Fibonacci.of(3)
    2

    iex> Fibonacci.of(4)
    3

    iex> Fibonacci.of(5)
    5

    iex> Fibonacci.of(6)
    8

    iex> Fibonacci.of(20)
    6765
  """
  def of(0), do: 0
  def of(1), do: 1

  def of(n), do: of(n-1) + of(n-2)

end


Fibonacci.of(0) |> IO.inspect()
Fibonacci.of(1) |> IO.inspect()
Fibonacci.of(2) |> IO.inspect()
Fibonacci.of(3) |> IO.inspect()
Fibonacci.of(4) |> IO.inspect()
Fibonacci.of(5) |> IO.inspect()
Fibonacci.of(6) |> IO.inspect()

Fibonacci.of(20) |> IO.inspect()
