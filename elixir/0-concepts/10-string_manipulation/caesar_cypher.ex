defmodule CaesarCypher do
  @moduledoc """
  Documentation for `CaesarCypher`
  """

  @doc """
  Encode a string using the caesar cypher.
  Shift every letter over by one.

  ## Examples

    iex> CaesarCypher.encode("abcdefghijklmnopqrstuvwxyz")
    "bcdefghijklmnopqrstuvwxyza"

  Encoding should work on any string

    iex> CaesarCypher.encode("hello")
    "ifmmp"
  """
  def encode(string) do
    encode(string,1)
  end

  @doc """
  Encode a string using the caesar cypher and a provided key.
  Shift every letter over by the provided key.

  ## Examples

    iex> CaesarCypher.encode("abcdefghijklmnopqrstuvwxyz", 1)
    "bcdefghijklmnopqrstuvwxyza"

    iex> CaesarCypher.encode("abcdefghijklmnopqrstuvwxyz", 2)
    "cdefghijklmnopqrstuvwxyzab"

    iex> CaesarCypher.encode("abcdefghijklmnopqrstuvwxyz", 14)
    "opqrstuvwxyzabcdefghijklmn"

  Encoding should work on any string.

    iex> CaesarCypher.encode("hello", 1)
    "ifmmp"
  """
  def encode(string, key) do
    String.to_charlist(string)
    |> Enum.map(fn char ->
      overflow = char + key > ?z
      if overflow do
        ?a + rem(char + key, ?z) - 1
      else
        char + key
      end
    end)
    |> List.to_string()
  end
end
CaesarCypher.encode("abcdefghijklmnopqrstuvwxyz", 1) |> IO.inspect()
CaesarCypher.encode("abcdefghijklmnopqrstuvwxyz", 2) |> IO.inspect()
CaesarCypher.encode("abcdefghijklmnopqrstuvwxyz", 14) |> IO.inspect()
