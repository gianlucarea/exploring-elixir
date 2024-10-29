defmodule Pascal do
  @doc ~S"""
  Generates a Pascal's Triangle of `n` rows.

  ## Examples

      iex> Pascal.of(1)
      [[1]]

      iex> Pascal.of(5)
      [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]
  """

  def row(1), do: [1]
  def row(2), do: [1, 1]
  def row(n), do: [1 | Enum.chunk(row(n - 1), 2, 1) |> Enum.map(fn [a, b] -> a + b end)] ++ [1]

  def of(n) do
    Enum.map(1..n, &row/1)
  end
end

Pascal.of(5) |> IO.inspect()
