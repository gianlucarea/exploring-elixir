defmodule NumberFinder do
  @doc """
  Find the smallest number in a list

  ## Examples

    iex> NumberFinder.smallest([2, 3, 1])
    1
    iex> NumberFinder.smallest([2, 2, 3, 4])
    2
    iex> NumberFinder.smallest([2, 2, 3, 4, 10, 20, -3])
    -3
  """
  def smallest(number_list) do
    Enum.reduce(number_list, fn value, accumulator ->
      min(value,accumulator)
    end)
  end

  @doc """
  Find the largest number in a list

  ## Examples

    iex> NumberFinder.largest([2, 3, 1])
    3
    iex> NumberFinder.largest([2, 2, 3, 4, 4])
    4
    iex> NumberFinder.largest([2, 2, 3, 4, 10, 20, -3])
    20
  """
  def largest(number_list) do
    Enum.reduce(number_list, fn value, accumulator ->
      max(value,accumulator)
    end)
  end
end

NumberFinder.smallest([2, 2, 3, 4, 10, 20, -3]) |> IO.inspect()
NumberFinder.largest([2, 2, 3, 4, 10, 20, -3]) |> IO.inspect()
