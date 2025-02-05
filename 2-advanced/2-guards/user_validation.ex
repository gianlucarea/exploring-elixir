defmodule User do
  @moduledoc """
  Send messages between users.
  Returns a string of the message if provided valid input.

  ## Examples

    iex> User.validate_users([%User{name: "valid user"}])
    [{:ok, %User{name: "valid user"}}]

    iex> User.validate_users([%User{name: nil}])
    [{:error, :missing_name}]

    iex> User.validate_users(["invalid user", "invalid user", "invalid user"])
    [{:error, :not_a_user}, {:error, :not_a_user}, {:error, :not_a_user}]
  """
  defstruct [:name]

  def validate_users(users) do
    Enum.map(users, fn user ->
      with %User{name: name} <- user, true <- is_binary(name) do
        {:ok, user}
      else
        false -> {:error, :missing_name}
        _ ->{:error, :not_a_user}
      end
    end)
  end
end
