defmodule WordCount do
  @moduledoc """
  Documentation for `WordCount`.
  """

  @doc """
  Concurrently count the number of words in each document.

  ## Examples

      iex> WordCount.individual_count(["document one", "document two"])
      [2, 2]
  """
  def individual_count(documents) do
    tasks =
      Enum.map(documents, fn document ->
        Task.async(fn ->
          document |> String.split(" ", trim: true) |> Enum.count()
        end)
      end)

    Task.await_many(tasks)
  end

  @doc """
  Concurrently count the number of words in each document and return
  the combined count.

  iex> WordCount.total_count(["document one", "document two"])
  4
  """
  def total_count(documents) do
    documents |> individual_count() |> Enum.sum()
  end
end
