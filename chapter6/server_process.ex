# Abstraction for the generic server process
defmodule ServerProcess do
  def start(callback_module) do
    spawn(fn  ->
      initial_state = callback_module.init #Invokes the callback to init the state
      loop(callback_module, initial_state)
    end)
  end

  defp loop(callback_module, current_state) do
    receive do
      {:call, request, caller} ->
        {response, new_state} = callback_module.handle_call(request,current_state)
        IO.inspect(new_state) # To print the map
        send(caller,{:response, response})
        loop(callback_module,new_state)

      {:cast, request} ->
        new_state = callback_module.handle_cast(request,current_state)
        loop(callback_module,new_state)
    end
  end

  #Async request
  def cast(server_pid, request) do
    send(server_pid,{:cast, request})
  end

  #Sync request
  def call(server_pid, request) do
    send(server_pid,{:call, request, self()})
    receive do
      {:response, response} ->
        response
        # code
    end
  end
end

defmodule KeyValueStore do

  def start do
    ServerProcess.start(KeyValueStore)
  end

  def put(pid, key, value) do
    ServerProcess.cast(pid, {:put, key, value})
  end

  def get(pid, key) do
    ServerProcess.call(pid, {:get, key})
  end

  def init do
    Map.new
  end

  def handle_cast({:put, key, value} , state) do
     Map.put(state,key,value)
  end
  #Get
  def handle_call({:get, key}, state) do
    {:ok, Map.get(state,key)}
  end

end

pid = KeyValueStore.start()
ServerProcess.cast(pid, {:put, :key1, 10})
ServerProcess.cast(pid, {:put, :key2, 20})
ServerProcess.cast(pid, {:put, :key3, 30})
ServerProcess.call(pid, {:get, :key2}) |> IO.inspect()
