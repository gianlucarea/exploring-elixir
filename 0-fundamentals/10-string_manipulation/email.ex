defmodule Email do
  @moduledoc """
  Documentation for `Email`
  """

  @doc """
  Checks if an email is valid.

  ## Examples

    iex> Email.valid?("mail@mail.com")
    true

    iex> Email.valid?("string@string.string")
    true

    iex> Email.valid?("string")
    false

    iex> Email.valid?(".string")
    false

    iex> Email.valid?("string.string")
    false

    iex> Email.valid?("string@string")
    false

    iex> Email.valid?("string@string.")
    false
  """
  def valid?(email) do
    Regex.match?(~r/\w+\@\w+\.\w+/ , email)
  end
end

Email.valid?("string@string.") |> IO.inspect()
Email.valid?("string@string.string") |> IO.inspect()
Email.valid?("mail@mail.com") |> IO.inspect()
Email.valid?(".string") |> IO.inspect()
