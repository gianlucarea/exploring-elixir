defmodule Timeline do
  @moduledoc """
  Documentation for `Timeline`
  """

  @doc """
  Given a list of [Date](https://hexdocs.pm/elixir/Date.html)s return a timeline of days between each date.

  ## Examples

    iex> Timeline.from_dates([~D[2020-01-01]])
    []

    iex> Timeline.from_dates([~D[2020-01-01], ~D[2020-01-02]])
    [1]

    iex> Timeline.from_dates([~D[2020-01-01], ~D[2020-01-02], ~D[2020-01-22]])
    [1, 20]

    iex> Timeline.from_dates([~D[2020-01-01], ~D[2020-01-10], ~D[2020-01-22], ~D[2020-01-24]])
    [9, 12, 2]
  """
 def from_dates(dates) do

  Enum.chunk_every(dates, 2, 1, :discard)
  |> Enum.map(fn chunk ->
    [start, finish] = chunk
    Date.diff(finish, start)
  end)
end

  @doc """
  Given a list of "YYYY-MM-DD" strings return a timeline of days between each date.
  Assume you will always be given two or more strings.

  ## Examples

    iex> Timeline.from_strings(["2020-01-01", "2020-01-02"])
    [1]

    iex> Timeline.from_strings(["2020-01-01", "2020-01-02", "2020-01-22"])
    [1, 20]

    iex> Timeline.from_strings(["2020-01-01", "2020-01-10", "2020-01-22", "2020-01-24"])
    [9, 12, 2]
  """
  def from_strings(date_strings) do
    date_strings
    |> Enum.map(&string_to_date/1)
    |> from_dates()
  end

  defp string_to_date(date_string) do
    [year, month, day] = String.split(date_string, "-")
    Date.new!(String.to_integer(year), String.to_integer(month), String.to_integer(day))
  end
end

Timeline.from_dates([~D[2020-01-01], ~D[2020-01-10], ~D[2020-01-22], ~D[2020-01-24]]) |> IO.inspect()
Timeline.from_strings(["2020-01-01", "2020-01-10", "2020-01-22", "2020-01-24"]) |> IO.inspect()
