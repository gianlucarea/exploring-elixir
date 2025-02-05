defmodule TodoList do
  @storage "todo_list"

  def list do
    case File.read(@storage) do
      {:ok, list} -> :erlang.binary_to_term(list)
      _ -> []
    end
  end

  def add(item) do
    new_list = [item | list()]
    File.write(@storage, :erlang.term_to_binary(new_list))
  end

  def complete(item) do
    new_list = list() -- [item]
    File.write(@storage, :erlang.term_to_binary(new_list))
  end
end
