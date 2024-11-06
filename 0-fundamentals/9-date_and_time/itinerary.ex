defmodule Itinerary do
  @doc """
  Given a number of minutes, determine if there is enough time
  between two `DateTimes` to fit an activity lasting a number of minutes.

  ## Examples

    iex> Itinerary.has_time?(~U[2020-01-01 12:00:00Z], ~U[2020-01-01 12:01:00Z], 1)
    true

    iex> Itinerary.has_time?(~U[2020-01-01 12:00:00Z], ~U[2020-01-01 12:10:00Z], 10)
    true

    iex> Itinerary.has_time?(~U[2020-01-01 07:00:00Z], ~U[2020-01-01 08:00:00Z], 60)
    true

    iex> Itinerary.has_time?(~U[2020-01-01 12:00:00Z], ~U[2020-01-01 12:30:00Z], 31)
    false

    iex> Itinerary.has_time?(~U[2020-01-01 07:00:00Z], ~U[2020-01-01 08:00:00Z], 61)
    false

  """
  def has_time?(start, finish, minutes) do
    between_to_times = DateTime.diff(finish,start,:minute)
    minutes <= between_to_times
  end
end

Itinerary.has_time?(~U[2020-01-01 07:00:00Z], ~U[2020-01-01 08:00:00Z], 60) |> IO.inspect()
Itinerary.has_time?(~U[2020-01-01 07:00:00Z], ~U[2020-01-01 08:00:00Z], 61) |> IO.inspect()
