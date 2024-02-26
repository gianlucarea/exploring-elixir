defmodule Todo.List do
  defstruct auto_id: 1, entries: Map.new
  # def new, do: %TodoList{} Old simple new
  def new(entries \\ []) do
    Enum.reduce(
      entries,
      %Todo.List{},
      &add_entry(&2,&1)
    )
  end

  def add_entry(
    %Todo.List{entries: entries, auto_id: auto_id} = todo_list, entry
  ) do
    entry = Map.put(entry, :id, auto_id)
    new_entry = Map.put(entries, auto_id, entry)
    %Todo.List{todo_list | entries: new_entry, auto_id: auto_id + 1}
  end

  def retrive_entries(todo_list , date) do

    todo_list.entries
    |> Map.values()
    |> Enum.filter(fn entry -> entry.date == date end) |> IO.inspect()
  end

  def update_entry(%Todo.List{} = todo_list, new_entry
  ) do
    update_entry(todo_list,new_entry.id, fn _ -> new_entry  end)
  end

  def update_entry(%Todo.List{entries: entries} = todo_list, entry_id, update_fun
  ) do
    case entries[entry_id] do
    nil -> todo_list #If not in entry don't do anything

    old_entry -> new_entry = %{} = update_fun.(old_entry) # #{} force you to pass map in the method
      new_entries = Map.put(entries, new_entry.id , new_entry)
      %Todo.List{todo_list | entries: new_entries}
    end
  end

  def delete_entry(%Todo.List{entries: entries} = todo_list, entry_id) do
    case entries[entry_id] do
      nil -> todo_list #The element is not inside the todolist!

      _ -> new_entries = Map.delete(entries, entry_id)
      %Todo.List{todo_list | entries: new_entries}
    end
  end
end
