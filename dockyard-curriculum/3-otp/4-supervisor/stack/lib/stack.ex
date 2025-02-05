defmodule Stack do
  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_call(:pop, _from, state) do
    [head | tail] = state
    {:reply, head, tail}
  end

  @impl true
  def handle_call({:push, element}, _from, state) do
    new_state = [element | state]
    {:reply, new_state, new_state}
  end
end

#Command line code to try
# {:ok, supervisor_pid} = Supervisor.start_link([{Stack,[]}], strategy: :one_for_one)
# GenServer.call(Stack, :pop)
# GenServer.call(Stack, {:push,1})
# GenServer.call(Stack, {:push,2})
# GenServer.call(Stack, {:push,3})
# GenServer.call(Stack, :pop)
# GenServer.call(Stack, :pop)
# GenServer.call(Stack, :pop)
# GenServer.call(Stack, :pop)
