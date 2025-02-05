defmodule TodoServer do
  def start do
    spawn(fn -> loop(TodoList.new) end)
  end

  def loop(%TodoList{entries: entries} = todo_list) do
    new_todo_list = receive do
      message ->
        process_message(todo_list,message)
    end

    loop(new_todo_list)
  end

  defp add_entry(todo_server, new_entry) do
    send(todo_server, {:add_entry, new_entry})
  end

  defp update_entry(todo_server, new_entry) do
    send(todo_server,{:update_entry, new_entry})
  end

  defp delete_entry(todo_server, entries) do
    send(todo_server,{:delete_entry, entries.id})
  end

  defp entries(todo_server, date) do
    send(todo_server, {:entries,self,date})
    receive do
      {:todo_entries, entries} -> entries
    after 5000 -> {:error, :timeout}
    end
  end

  defp process_message(todo_list, {:entries, caller, date}) do
    send(caller, {:todo_entries, TodoList.entries(todo_list,date)})
    todo_list
  end

  defp process_message(todo_list, {:update_entry, new_entry}) do
    TodoList.update_entry(todo_list,new_entry.id, new_entry)
    todo_list
  end

  defp process_message(todo_list, {:add_entry, new_entry}) do
    TodoList.add_entry(todo_list,new_entry)
    todo_list
  end

  defp process_message(todo_list, {:delete_entry, entries_id}) do
    TodoList.delete_entry(todo_list,entries_id)
    todo_list
  end
end


defmodule TodoList do
  defstruct auto_id: 1, entries: Map.new
  # def new, do: %TodoList{} Old simple new
  def new(entries \\ []) do
    Enum.reduce(
      entries,
      %TodoList{},
      &add_entry(&2,&1)
    )
  end

  def add_entry(
    %TodoList{entries: entries, auto_id: auto_id} = todo_list, entry
  ) do
    entry = Map.put(entry, :id, auto_id)
    new_entry = Map.put(entries, auto_id, entry)
    %TodoList{todo_list | entries: new_entry, auto_id: auto_id + 1}
  end

  def retrive_entries(%TodoList{entries: entries} , date) do
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

      _ -> new_entries = Map.delete(entries, entry_id)
      %TodoList{todo_list | entries: new_entries}
    end
  end
end

defimpl Collectable, for: TodoList do
  # Appender Lambda
  def into(original) do
    {original, &into_callback/2}
  end

  #Append if new entry
  defp into_callback(todo_list,{:cont, entry}) do
    TodoList.add_entry(todo_list,entry)
  end

  #Return the todo_list
  defp into_callback(todo_list, :done), do: todo_list
  #If call is halted operation is cancelled
  defp into_callback(todo_list, :halt), do: :ok
end

defmodule TodoList.CSVImporter do

  def import!(path) do
    path
    |> read
    |> build
    |> TodoList.new
  end

  defp read(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
  end

  defp build(lines) do
    lines
    |> Stream.map(&split_on_comma/1)
    |> Stream.map(&create_entry/1)
  end

  defp split_on_comma(line) do
    line
    |> String.split(",")
    |> create_tuple_from_split
  end


  defp create_tuple_from_split([date, title]) do
    {parse_date(date), title}
  end

  defp parse_date(date) do
    date
    |> String.split("/")
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple
  end

  defp create_entry({date, title}) do
    %{date: date, title: title}
  end

end

TodoList.CSVImporter.import!("./prova.csv") |> IO.inspect()

#TodoList.new() |> TodoList.add_entry(%{ date: {2024,02,22} , title: "School"})
#|> TodoList.add_entry(%{ date: {2024,02,23} , title: "Football"})
#|> TodoList.add_entry(%{ date: {2024,02,22} , title: "Dinner"})
#|> TodoList.add_entry(%{ date: {2024,02,22} , title: "Dinner"})
#|> TodoList.update_entry(1, &Map.put(&1, :date, {2024,02,23}))
#|> TodoList.delete_entry(2)
#|> IO.inspect()
