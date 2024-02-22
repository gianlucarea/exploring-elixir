defmodule TodoList do
  defstruct auto_id: 1, entries: Map.new

  def new, do: %TodoList{}

  def add_entry(
    %TodoList{entries: entries, auto_id: auto_id} = todo_list, entry
  ) do
    entry = Map.put(entry, :id, auto_id)
    new_entry = Map.put(entries, auto_id, entry)
    %TodoList{todo_list | entries: new_entry, auto_id: auto_id + 1}
  end

  def entries(%TodoList{entries: entries} , date) do
    entries |> Stream.filter(fn {_, entry} -> entry.date == date end)
    |> Enum.map(fn {_,entry} -> entry  end)
  end

  def update_entry(%TodoList{entries: entries} = todo_list, entry_id, update_fun
  ) do
    case entries[entry_id] do
    nil -> todo_list #If not in entry don't do anything

    old_entry -> new_entry = %{} = update_fun.(old_entry) # #{} force you to pass map in the method
      new_entries = Map.put(entries, new_entry.id , new_entry)
      %TodoList{todo_list | entries: new_entries}
    end
  end

  def delete_entry(%TodoList{entries: entries} = todo_list, entry_id) do
    case entries[entry_id] do
      nil -> todo_list #The element is not inside the todolist!

      old_entry -> new_entries = Map.delete(entries, entry_id)
      %TodoList{todo_list | entries: new_entries}
    end
  end
end

TodoList.new() |> TodoList.add_entry(%{ date: {2024,02,22} , title: "School"})
|> TodoList.add_entry(%{ date: {2024,02,23} , title: "Football"})
|> TodoList.add_entry(%{ date: {2024,02,22} , title: "Dinner"})
|> TodoList.add_entry(%{ date: {2024,02,22} , title: "Dinner"})
|> TodoList.update_entry(1, &Map.put(&1, :date, {2024,02,23}))
|> TodoList.delete_entry(2)
|> IO.inspect()
