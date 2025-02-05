defmodule KeyValueStore do
  use GenServer

  def start do
    GenServer.start(KeyValueStore, nil)
  end

  def init(_) do
    {:ok, Map.new()}
  end

  def put(pid, key, value) do
    GenServer.cast(pid,{:put, key, value})
  end

  def get(pid,key) do
    GenServer.call(pid,{:get, key})
  end

  def handle_call({:get, key}, _ , state) do

    {:reply, Map.get(state,key), state}
  end

  def handle_cast({:put, key, value} , state) do
    {:noreply, Map.put(state,key,value)}
  end
end

{:ok, pid} = KeyValueStore.start()
KeyValueStore.put(pid, :key1, 10)
KeyValueStore.put(pid, :key2, 20)
KeyValueStore.put(pid, :key3, 30)
KeyValueStore.put(pid, :key4, 40)
KeyValueStore.get(pid, :key3) |> IO.inspect()
