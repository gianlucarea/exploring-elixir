defmodule FileSearch do
  @moduledoc """
  Documentation for FileSearch
  """

  @doc """
  Find all nested files.

  For example, given the following folder structure
  /main
    /sub1
      file1.txt
    /sub2
      file2.txt
    /sub3
      file3.txt
    file4.txt

  It would return:

  ["file1.txt", "file2.txt", "file3.txt", "file4.txt"]
  """
  def all(folder) do
    File.ls!(folder)
    |> Enum.map(fn file_or_folder ->

    path = Path.join(folder, file_or_folder)
    if(File.dir?(path)) do
      all(path)
    else
      file_or_folder
    end
      end)
    |> List.flatten()
  end

  @doc """
  Find all nested files and categorize them by their extension.

  For example, given the following folder structure
  /main
    /sub1
      file1.txt
      file1.png
    /sub2
      file2.txt
      file2.png
    /sub3
      file3.txt
      file3.jpg
    file4.txt

  The exact order and return value are up to you as long as it finds all files
  and categorizes them by file extension.

  For example, it might return the following:

  %{
    ".txt" => ["file1.txt", "file2.txt", "file3.txt", "file4.txt"],
    ".png" => ["file1.png", "file2.png"],
    ".jpg" => ["file3.jpg"]
  }
  """
  def by_extension(folder) do
    all(folder)
    |> Enum.reduce(%{}, fn file_name, acc ->
      extension = Path.extname(file_name)
      Map.update(acc, extension, [file_name], fn files -> [file_name | files] end)
    end)
  end
end
