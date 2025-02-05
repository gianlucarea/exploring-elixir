defmodule Mailbox do
  @moduledoc """
  Documentation for `Mailbox`
  """

  @doc """
  Recursively loop and receive messages.
  This doctest will timeout if there is no implementation.

  ## Examples

      iex> mailbox_process = spawn(fn -> Mailbox.loop() end)
      iex> send(mailbox_process, {:send, "Hello!"})
      iex> send(mailbox_process, {:read, self()})
      iex> receive do
      ...>  message -> message
      ...> end
      "Hello!"
  """
  def loop(state \\ []) do
    receive do
      {:send, message} ->
        IO.puts(message)
        loop([message | state])

      {:read, from_pid} ->
        case state do
          [head | tail] ->
           send(from_pid,head)
           loop(tail)

          [] ->
            send(from_pid,:empty)
            loop([])
        end
    end
  end
end
