defmodule Math do
  @moduledoc """
  iex> Math.add(1, 1)
  2

  iex> Math.add([1, 2], [3, 4])
  [1, 2, 3, 4]

  iex> Math.add("hello ", "there")
  "hello there"

  iex> Math.subtract(2, 1)
  1

  iex> Math.subtract([3, 2, 3], [3])
  [2, 3]

  iex> Math.subtract("babc", "bc")
  "ab"

  iex> Math.add(2, "2")
  ** (FunctionClauseError) no function clause matching in Math.add/2
  """

  def add(integer1, integer2) when is_integer(integer1) and is_integer(integer2) do
    integer1 + integer2
  end

  def add(list1, list2) when is_list(list1) and is_list(list2) do
    list1 ++ list2
  end

  def add(string1, string2) when is_binary(string1) and is_binary(string2) do
    string1 <> string2
  end

  def subtract(integer1, integer2) when is_integer(integer1) and is_integer(integer2) do
    integer1 - integer2
  end

  def subtract(list1, list2) when is_list(list1) and is_list(list2) do
    list1 -- list2
  end

  def subtract(string1, string2) when is_binary(string1) and is_binary(string2) do
    String.split(string1, "")
    |> subtract(String.split(string2, ""))
    |> Enum.join()
  end

end
