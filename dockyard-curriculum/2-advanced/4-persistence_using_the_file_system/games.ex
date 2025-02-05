defmodule Game do
  @moduledoc """
  Documentation for `Game`

  ## Examples

      game_state = %{name: "Peter Parker", level: 10, location: "New York"}

      Game.save(game_state, "save_file1")
      :ok

      Game.load("save_file1")
      %{name: "Peter Parker", level: 10, location: "New York"}
  """

  @doc """
  Save an elixir term into a given file name.
  """
  def save(data, filename) do
    File.write!(filename, :erlang.term_to_binary(game_state))
  end

  @doc """
  Retrieve an elixir term from a given file name.
  """
  def load(filename) do
    File.read!(filename) |> :erlang.binary_to_term()
  end
end
