defmodule TimeConverter do
  @moduledoc """
  Documentation for `TimeConverter`
  """

  @doc """
  Convert a unit of time to a number of seconds.

  ## Examples

    iex> TimeConverter.to_seconds(1, :seconds)
    1

    iex> TimeConverter.to_seconds(1, :minutes)
    60

    iex> TimeConverter.to_seconds(1, :hours)
    3600

    iex> TimeConverter.to_seconds(1, :days)
    86400

  """
  def to_seconds(amount, unit) do
    case unit do
      :seconds -> amount
      :minutes -> amount * 60
      :hours -> amount * 60 * 60
      :days -> amount * 60 * 60 * 24
    end
  end

  @doc """
  Convert a number of seconds to a unit of time.
  Return a float, as these values will require division using `/`.

  ## Examples

    iex> TimeConverter.from_seconds(1, :seconds)
    1.0

    iex> TimeConverter.from_seconds(60, :minutes)
    1.0

    iex> TimeConverter.from_seconds(3600, :hours)
    1.0

    iex> TimeConverter.from_seconds(86400, :days)
    1.0

  """
  def from_seconds(amount, unit) do
    case unit do
      :seconds -> amount
      :minutes -> amount / 60
      :hours -> amount / 60 / 60
      :days -> amount / 60 / 60 / 24
    end
  end
end

TimeConverter.to_seconds(400, :minutes) |> IO.inspect()
TimeConverter.to_seconds(8, :hours) |> IO.inspect()
TimeConverter.to_seconds(5, :hours) |> IO.inspect()

TimeConverter.from_seconds(86400, :minutes) |> IO.inspect()
TimeConverter.from_seconds(86400, :hours) |> IO.inspect()
TimeConverter.from_seconds(86400, :days) |> IO.inspect()
