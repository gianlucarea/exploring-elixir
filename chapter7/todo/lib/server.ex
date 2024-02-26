defmodule Todo.Server do
  use GenServer

  def start do
    GenServer.start(Todo.Server,nil)
  end

  def init(_) do
    {:ok, Todo.List.new()}
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
    GenServer.call(pid, {:entries, date})
  end

  def handle_cast({:add_entry, entry}, state) do
    {:noreply, Todo.List.add_entry(state,entry)}
  end

  def handle_cast({:delete_enty, entry_id}, state) do
    {:noreply, Todo.List.delete_entry(state,entry_id)}
  end

  def handle_cast({:update_entry, entry}, state) do
    {:noreply, Todo.List.update_entry(state, entry)}
  end

  def handle_call({:entries, date}, _, state) do
      {:reply, Todo.List.retrive_entries(state,date), state}
  end
end
