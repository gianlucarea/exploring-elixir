defmodule Anagram do
  @moduledoc """
  Documentation for `Anagram`.
  """

  @doc """
  Determine if two strings are anagrams.

  ## Examples

    iex> Anagram.anagram?("abc", "bac")
    true

    iex> Anagram.anagram?("sit", "its")
    true

    iex> Anagram.anagram?("cats", "dogs")
    false

    iex> Anagram.anagram?("robed", "bored")
    true
  """
  def anagram?(word, possible_anagram) do
    list1 = String.to_charlist(word)
    list2 = String.to_charlist(possible_anagram)
    Enum.sort(list1) == Enum.sort(list2)
  end

  @doc """
  Filter anagrams.

  ## Examples

    iex> Anagram.filter_anagrams(["abc", "bca", "abcd", "cat"], "bac")
    ["abc", "bca"]

    iex> Anagram.filter_anagrams(["rams", "mars", "arms", "alarms"], "arms")
    ["rams", "mars", "arms"]

    iex> Anagram.filter_anagrams(["stop"], "go")
    []
  """
  def filter_anagrams(word_list, anagram) do
    Enum.filter(word_list, fn word -> anagram?(anagram,word) end )
  end
end
