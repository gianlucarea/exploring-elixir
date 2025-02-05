defmodule TodoServer do
  use GenServer

  def start do
    GenServer.start(TodoServer,nil)
  end

  def init(_) do
    {:ok, TodoList.new()}
  end

  def add_entry(pid, entry) do
    GenServer.cast(pid, {:add_entry, entry})
  end

  def delete_entry(pid, entry_id) do
    GenServer.cast(pid, {:delete_entry, entry_id})
  end

  def update_entry(pid,entry) do
    GenServer.cast(pid, {:update_entry, entry})
  end

  def get_entries(pid, date) do
    GenServer.call(pid, {:entries , date})
  end

  def handle_cast({:add_entry, entry}, state) do
    {:noreply, TodoList.add_entry(state,entry)}
  end

  def handle_cast({:delete_enty, entry_id}, state) do
    {:noreply, TodoList.delete_entry(state,entry_id)}
  end

  def handle_cast({:update_entry, entry}, state) do
    {:noreply, TodoList.update_entry(state, entry)}
  end

  def handle_call({:entries, date}, state) do
    {:reply, TodoList.retrive_entries(state,date), state}
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

  def update_entry(%TodoList{} = todo_list, new_entry
  ) do
    update_entry(todo_list,new_entry.id, fn _ -> new_entry  end)
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
