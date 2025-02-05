defmodule Palindrome do
  @moduledoc """
  Documentation for `Palindrome`.
  """

  @doc """
  Determine if a string is a palindrome.

  ## Examples

    iex> Palindrome.palindrome?("baab")
    true

    iex> Palindrome.palindrome?("racecar")
    true

    iex> Palindrome.palindrome?("kayak")
    true

    iex> Palindrome.palindrome?("apples")
    false
  """
  def palindrome?(string) do
  string |> String.split("") |> Enum.reverse() |> Enum.join() == string
  end
end

Palindrome.palindrome?("baab") |> IO.inspect()
Palindrome.palindrome?("racecar") |> IO.inspect()
Palindrome.palindrome?("kayak") |> IO.inspect()
Palindrome.palindrome?("apples") |> IO.inspect()
