defmodule FileRocket do

  def small_lines!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1,"\n", ""))
    |> Enum.filter(&(String.length(&1) < 30 && String.length(&1) > 0))
  end

  def large_lines!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1,"\n", ""))
    |> Enum.filter(&(String.length(&1) > 80))
  end

  def lines_lengths!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1,"\n",""))
    |> Enum.map(&(String.length(&1)))
  end

  def longest_line_lenght!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1,"\n",""))
    |> Enum.map(&(String.length(&1)))
    |> Enum.reduce(0, fn element, value when is_number(element) and element > value ->
      value = element

      _, value -> value
    end)
  end

  def longest_line!(path) do
    x = FileRocket.longest_line_lenght!(path)
    File.stream!(path)
    |> Stream.map(&String.replace(&1,"\n",""))
    |> Enum.filter(&(String.length(&1) === x))
  end

  def words_per_line!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1,"\n",""))
    |> Enum.map(&(length(String.split(&1))))
  end
end

FileRocket.large_lines!("./prova.txt") |> IO.inspect()
FileRocket.lines_lengths!("./prova.txt") |> IO.inspect()
FileRocket.longest_line_lenght!("./prova.txt") |> IO.inspect()
FileRocket.longest_line!("./prova.txt") |> IO.inspect()
FileRocket.words_per_line!("./prova.txt") |> IO.inspect()
