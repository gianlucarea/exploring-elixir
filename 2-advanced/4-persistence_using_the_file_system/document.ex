defmodule Document do
  @moduledoc """
  Documentation for `Document` module.
  """

  @doc ~S"""
  Count the number of words in a document.

  ## Examples

      Any sequence of characters separated by a space will be considered a word.

      iex> File.write("word_count.txt", "one two three")
      iex> Document.word_count("word_count.txt")
      3

      Ensure your solution ignores newline characters.

      iex> File.write("word_count.txt", "one\ntwo\nthree")
      iex> Document.word_count("word_count.txt")
      3
  """
  def word_count(file_name) do
    File.stream!(file_name) |>
    Stream.map(fn line ->
      line
      |> String.split(" ", trim: true)
      |> Enum.count()
      end) |> Enum.sum()
  end

  @doc ~S"""
  Count the number of words in a document.

  ## Examples

      iex> File.write("line_count.txt", "line1\nline2\nline3\n")
      iex> Document.line_count("line_count.txt")
      3
  """
  def line_count(file_name) do
    File.stream!(file_name)
    |> Stream.map(fn line -> line end)
    |> Enum.count()
  end

  @doc ~S"""
  Add line numbers formatted as "X. rest of line" to an existing file.

  ## Examples

      iex> File.write("add_line_numbers.txt", "one\ntwo\nthree")
      iex> Document.add_line_numbers("add_line_numbers.txt")
      iex> File.read!("add_line_numbers.txt")
      "1. one\n2. two\n3. three"
  """
  def add_line_numbers(file_name) do
    lined_content =
      File.stream!(file_name)
      |> Stream.with_index()
      |> Stream.map(fn {line, index} -> "#{index + 1}. #{line}" end)
      |> Enum.join("")

    File.write!(file_name, lined_content)
  end
end
