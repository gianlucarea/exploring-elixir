defmodule PhoneNumber do
  @moduledoc """
  Documentation for `PhoneNumber`
  """

  @doc """
  Parse phone numbers and convert them to XXX-XXX-XXXX format.

  ## Examples

    iex> PhoneNumber.parse("1231231234")
    "123-123-1234"

    iex> PhoneNumber.parse("123 123 1234")
    "123-123-1234"

    iex> PhoneNumber.parse("(123)-123-1234")
    "123-123-1234"

    iex> PhoneNumber.parse("(123) 123 1234")
    "123-123-1234"

    iex> PhoneNumber.parse("(123)123-1234")
    "123-123-1234"

    iex> PhoneNumber.parse("1231231234 4564564567")
    "123-123-1234 456-456-4567"
  """
  def parse(string) do
    replacement = "\\1-\\2-\\3"

    string
    |> String.replace(~r/(\d{3})(\d{3})(\d{4})/, replacement)
    |> String.replace(~r/(\d{3}) (\d{3}) (\d{4})/, replacement)
    |> String.replace(~r/\((\d{3})\)-(\d{3})-(\d{4})/, replacement)
    |> String.replace(~r/\((\d{3})\) (\d{3}) (\d{4})/, replacement)
    |> String.replace(~r/\((\d{3})\)(\d{3})-(\d{4})/, replacement)
  end
end
PhoneNumber.parse("1231231234") |> IO.inspect()
PhoneNumber.parse("(123) 123 1234") |> IO.inspect()
PhoneNumber.parse("1231231234 4564564567") |> IO.inspect()
