defmodule AnagramSolver do
  @doc """
  Return a list of all string permutations to solve for all anagrams.
  Hard problem

  ## Examples

    iex> AnagramSolver.solve("a")
    ["a"]

    iex> AnagramSolver.solve("ab")
    ["ab", "ba"]

    iex> AnagramSolver.solve("abc")
    ["abc", "acb", "bac", "bca", "cab", "cba"]
  """
  def solve(string) do
    String.split(string,"", trim: true)
    |> permutations()
    |> cleaning()
  end

  def permutations([]), do: [[]]
  def permutations(list) do
    for elem <- list, rest <- permutations(list--[elem]) do
      [elem|rest]
    end
  end

  def cleaning(list_of_list) do
    for list <- list_of_list do
      Enum.join(list)
    end
  end
end

AnagramSolver.solve("abcd") |> IO.inspect()
