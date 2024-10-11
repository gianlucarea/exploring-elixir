defmodule Filter do
  @doc """
  Filter in integers in list.

  ## Examples

    iex> Filter.integers([1, 2, %{}, {}, []])
    [1, 2]
  """
  def integers(list) do
    Enum.filter(list, fn value -> is_integer(value) end)
  end

  @doc """
  Filter in floats in list.

  ## Examples

    iex> Filter.floats([1, 2, %{}, {}, [], 1.2, 3.2])
    [1.2, 3.2]
  """
  def floats(list) do
    Enum.filter(list, fn value -> is_float(value) end)
  end

  @doc """
  Filter in numbers and floats in list.

  ## Examples

    iex> Filter.numbers([1, 2, %{}, {}, [], 1.2, 3.2])
    [1, 2, 1.2, 3.2]
  """
  def numbers(list) do
    Enum.filter(list, fn value -> is_number(value) end)
  end

  @doc """
  Filter in atoms in list.

  ## Examples

    iex> Filter.atoms([1, 2, %{}, {}, [], :first_atom, 1.2, 3.2, :second_atom])
    [:first_atom, :second_atom]
  """
  def atoms(list) do
    Enum.filter(list, fn value -> is_atom(value) end)

  end

  @doc """
  Filter in lists and keyword lists in list.

  ## Examples

    iex> Filter.lists([1, 2, %{}, {}, [], 1.2, 3.2, :atom, [1, 2], [4, 5, 6]])
    [[], [1, 2], [4, 5, 6]]
  """
  def lists(list) do
    Enum.filter(list, fn value -> is_list(value) or Keyword.keyword?(value) end)
  end

  @doc """
  Filter in maps in list.

  ## Examples

    iex> Filter.maps([1, 2, %{}, {}, [], 1.2, 3.2, :atom, %{key: "value"}])
    [%{}, %{key: "value"}]
  """
  def maps(list) do
    Enum.filter(list, fn value -> is_map(value) end)
  end

  @doc """
  Filter in keyword lists.

  ## Examples

    iex> Filter.keyword_lists([1, 2, %{}, {}, [], 1.2, 3.2, :atom, %{key: "value"}, [key: "value"]])
    [[], [key: "value"]]
  """
  def keyword_lists(list) do
    Enum.filter(list, fn value ->  Keyword.keyword?(value) end)
  end
end

Filter.integers([1, 2, %{}, {}, []]) |> IO.inspect()
Filter.floats([1, 2, %{}, {}, [], 1.2, 3.2]) |> IO.inspect()
Filter.numbers([1, 2, %{}, {}, [], 1.2, 3.2]) |> IO.inspect()
Filter.atoms([1, 2, %{}, {}, [], :first_atom, 1.2, 3.2, :second_atom]) |> IO.inspect()
Filter.lists([1, 2, %{}, {}, [], 1.2, 3.2, :atom, [1, 2], [4, 5, 6]]) |> IO.inspect()
Filter.maps([1, 2, %{}, {}, [], 1.2, 3.2, :atom, %{key: "value"}]) |> IO.inspect()
Filter.keyword_lists([1, 2, %{}, {}, [], 1.2, 3.2, :atom, %{key: "value"}, [key: "value"]]) |> IO.inspect()
