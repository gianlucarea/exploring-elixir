defmodule DataTraversal do
  @doc """
  Sum all of the integer values in a keyword list. The keys do not matter.

  iex> DataTraversal.sum([key: 10, key: 20, key: 30])
  60
  """
  def sum(keyword_list) do
    Enum.reduce(keyword_list,0, fn {_key, value}, acc -> acc + value end)
  end

  @doc """
  Aggregate values with common keys in a keyword list.
  Ensure aggregated values are sorted with Enum.sort/1

  iex> DataTraversal.aggregate([key1: 10, key1: 20, key2: 30, key2: 20])
  [key1: 30, key2: 50]
  """
  def aggregate(keyword_list) do
    Enum.reduce(keyword_list,[], fn {key, value}, acc ->
      previous = acc[key] || 0
      Keyword.put(acc, key, previous + value)
    end) |> Enum.sort()
  end

  @doc """
  Merge a list of maps together. New values will replace old values.

  iex> maps = [%{keya: "a"}, %{keyb: "b"}, %{keyc: "c"}, %{keyc: "c2"}]
  iex> DataTraversal.merge_maps(maps)
  %{keya: "a", keyb: "b", keyc: "c2"}
  """
  def merge_maps(maps) do
    Enum.reduce(maps,%{},fn map, acc ->
      Map.merge(acc,map)
    end)
  end
end


DataTraversal.sum([key: 10, key: 20, key: 30]) |> IO.inspect()
DataTraversal.aggregate([key1: 10, key1: 20, key2: 30, key2: 20]) |> IO.inspect()
[%{keya: "a"}, %{keyb: "b"}, %{keyc: "c"}, %{keyc: "c2"}] |> DataTraversal.merge_maps()|> IO.inspect()
