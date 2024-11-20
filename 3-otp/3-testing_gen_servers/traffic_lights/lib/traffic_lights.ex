defmodule TrafficLights.Light do
  use GenServer
  #Client
  def start_link(), do: GenServer.start_link(__MODULE__,[])

  def current_light(pid), do: GenServer.call(pid, :current_light)

  def transition(pid), do: GenServer.cast(pid, :transition)

  #Server
  @impl true
  def init(_opts), do: {:ok, :green}

  @impl true
  def handle_call(:current_light, _from, state), do: {:reply, state, state}

  @impl true
  def handle_cast(:transition, state) do
    transited_state =
      case state do
      :green -> :yellow
      :yellow -> :red
      :red -> :green
      end
    {:noreply,transited_state}
  end
end


defmodule TrafficLights.Grid do
  use GenServer
  #Client
  def start_link(), do: GenServer.start_link(__MODULE__,[])

  def current_light(pid), do: GenServer.call(pid, :current_light)

  def transition(pid), do: GenServer.call(pid, :transition)

  #Server
  @impl true
  def init(_opts) do
   light_pids =
      Enum.map(1..5, fn _ ->
        {:ok, pid} = TrafficLights.Light.start_link()
        pid
      end)

    {:ok, %{light_pids: light_pids, transition_index: 0}}
  end

  @impl true
  def handle_call(:current_light, _from, state) do
    lights = Enum.map(state.light_pids, &TrafficLights.Light.current_light/1)
    {:reply, lights, state}
  end

  @impl true
  def handle_call(:transition, _from, state) do
    light_pid = Enum.at(state.light_pids, state.transition_index)
    TrafficLights.Light.transition(light_pid)

    lights = Enum.map(state.light_pids, &TrafficLights.Light.current_light/1)
    next_transition_index = rem(state.transition_index + 1, length(state.light_pids))

    {:reply, lights, %{state | transition_index: next_transition_index}}
  end
end
