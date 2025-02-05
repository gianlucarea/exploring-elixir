# Create a Zero Genserver that does nothing other than store the integer 0 in its state.
# Use GenServer.start_link/3 to start the Zero process.
# Use :sys.get_state/1 to view the state of your Zero process.
defmodule Zero do
  use GenServer
  def init(_opts),do: {:ok, 0}
end

{:ok, pid} = GenServer.start_link(Zero, "init_arg")
:sys.get_state(pid)

# Use GenServer.start_link/3 to start your Zero GenServer as a named process.
GenServer.start_link(Zero,"init_arg",[name: Zero])
:sys.get_state(Zero)

# Create a SimpleCounter GenServer whose state starts as 0.
# Implement a GenServer.handle_call/3 callback function which accepts the :increment message and increments the state by 1 and returns :ok.
# Use GenServer.start_link/3 and GenServer.call/3 to spawn a SimpleCounter process and send it an :increment message.
# Use :sys.get_state/1 to see that the state of the counter has incremented.
defmodule SimpleCounter do
  use GenServer

  @impl true
  def init(_args), do: {:ok, 0}

  @impl true
  def handle_call(:increment, _from, state), do: {:reply, :ok, state + 1}

  @impl true
  def handle_call(:decrement, _from, state), do: {:reply, :ok, state - 1}
end

{:ok, pid} = GenServer.start_link(SimpleCounter, [])
GenServer.call(pid, :increment)
GenServer.call(pid, :increment)
GenServer.call(pid, :increment)
GenServer.call(pid, :decrement)
:sys.get_state(pid)

# Create an InitialState GenServer whose initial state can be configured.
# Call GenServer.start_link/3 to spawn a State GenServer with an initial state.
# Use :sys.get_state/1 to confirm the state matches your configured state.
defmodule InitialState do
  use GenServer

  @impl true
  def init(state) do
    {:ok, state}
  end
end

{:ok,pid} = GenServer.start_link(InitialState,100)
:sys.get_state(pid)

# Create a State module.
# It should:
# 1. Define a State.get/1 function that uses GenServer.call/3 and a GenServer.handle_call/3 callback function to retrieve state.
# 2. Define a State.set/2 function that uses GenServer.cast/2 and a GenServer.handle_cast/2 callback function to update state.
# 3. Define a State.start_link/3 function with a GenServer.init/1 callback function to initialize the GenServer with a configurable state.
# Manually test each function (State.set/2, State.get/1 and State.start_link/3) to confirm they work as expected.
defmodule State do
  use GenServer

   @impl
   def init(state), do: {:ok , state}

   @impl
   def handle_call(:get,_from,state), do: {:reply,state,state}

   @impl
   def handle_cast({:set,new_state}, _state), do: {:noreply,new_state}

   def get(pid), do: GenServer.call(pid, :get)

   def set(pid,new_state), do: GenServer.cast(pid,{:set,new_state})

   def start_link(state), do: GenServer.start_link(__MODULE__,state)

 end

 {:ok, pid} = State.start_link("200")
 "200" = State.get(pid)
 State.set(pid, "20")
 "20" = State.get(pid)

# Create a minimal Named GenServer that can be started and configured as a named process using Named.start_link/1.
# Start a Named process and use GenServer.whereis/1 and/or Process.whereis/1 to find the pid of the named process.

 defmodule Named do
  use GenServer

  def start_link(opts) do
    name = Keyword.get(opts, :name, __MODULE__)
    GenServer.start_link(__MODULE__, [], name: name)
  end

  def init(_opts) do
    {:ok, 0}
  end
end

Named.start_link([name: Named])
Process.whereis(Named)

# Create a minimal NamedState GenServer that can be started and configured as a named process with a configurable state using NamedState.start_link.
# Use :sys.get_state/1 to confirm the initial state is as expected and GenServer.whereis/1 and/or Process.whereis/1 to find the pid of the named process.
defmodule NamedState do
  use GenServer

  def start_link(opts) do
    name = Keyword.get(opts, :name, __MODULE__)
    state = Keyword.get(opts, :state)
    GenServer.start_link(__MODULE__, state, name: name)
  end

  def init(state) do
    {:ok, state}
  end
end

NamedState.start_link(state: 100,name: NamedState)
:sys.get_state(NamedState) |> IO.inspect()
Process.whereis(NamedState)
