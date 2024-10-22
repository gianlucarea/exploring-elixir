defmodule Factorial do
  @doc """
  Find the factorial of an integer.

  ## Examples

    iex> Factorial.of(1)
    1

    iex> Factorial.of(2)
    2

    iex> Factorial.of(3)

    6

    iex> Factorial.of(4)
    24

    iex> Factorial.of(5)
    120

    iex> Factorial.of(10)
    3628800
  """

  def of(1) , do: 1
  def of(n), do: n * of(n-1)

end

Factorial.of(1) |> IO.inspect()
Factorial.of(2) |> IO.inspect()
Factorial.of(3) |> IO.inspect()
Factorial.of(10) |> IO.inspect()
