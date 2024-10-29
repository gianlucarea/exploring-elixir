defmodule Lucas do
  @doc """
  return the nth lucas number.

  ## Examples
    L(n)=L(n-1)+L(n - 2).
    iex> Lucas.number(0)
    2

    iex> Lucas.number(1)
    1

    iex> Lucas.number(2)
    3

    iex> Lucas.number(3)
    4

    iex> Lucas.number(4)
    7

    iex> Lucas.number(5)
    11

    iex> Lucas.number(6)
    18

    iex> Lucas.number(20)
    15127
  """

  def number(0), do: 2
  def number(1), do: 1
  def number(n), do: number(n-1) + number(n-2)

  @doc """
  Generate a list of lucas numbers with the given length.

  ## Examples

    iex> Lucas.sequence(1)
    [2]

    iex> Lucas.sequence(2)
    [2, 1]

    iex> Lucas.sequence(3)
    [2, 1, 3]

    iex> Lucas.sequence(4)
    [2, 1, 3, 4]

    iex> Lucas.sequence(10)
    [2, 1, 3, 4, 7, 11, 18, 29, 47, 76]
  """

  def sequence(length) do
    Enum.map(1..length, &number(&1 - 1))
  end
end

Lucas.number(10) |> IO.inspect()
Lucas.sequence(10) |> IO.inspect()
