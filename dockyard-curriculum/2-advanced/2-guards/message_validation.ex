defmodule Message do

  defstruct body: "Hi"

  @moduledoc """
  Send messages between users.
  Returns a string of the message if provided valid input.

  ## Examples

    iex> Message.send("hello!")
    "Sent: hello!"

    iex> Message.send(%Message{body: "hi!"})
    "Sent: hi!"

    iex> Message.send(123)
    ** (FunctionClauseError) no function clause matching in Message.send/1
  """

  def send(message) when is_binary(message) do
    "Sent: #{message}"
  end

  def send(message) when is_binary(message.body) do
    "Sent: #{message.body}"
  end

  def main() do
    %Message{}
  end

end

Message.send("hello!") |> IO.inspect()
Message.main()|> Message.send() |> IO.inspect()
Message.send(2000) |> IO.inspect()
