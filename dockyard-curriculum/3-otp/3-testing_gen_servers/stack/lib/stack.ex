defmodule Stack do
  use GenServer

  # Client API

  def start_link(initial_state \\ []) do
    GenServer.start_link(__MODULE__, initial_state, name: __MODULE__)
  end

  def push(pid, element) do
    GenServer.call(pid, {:push, element})
  end

  def pop(pid, count \\ 1) do
    GenServer.call(pid, {:pop, count})
  end

  # Server Callbacks

  @impl true
  def init(initial_state) do
    {:ok, initial_state}
  end

  @impl true
  def handle_call({:push, element}, _from, state) do
    {:reply, :ok, [element | state]}
  end

  @impl true
  def handle_call({:pop, count}, _from, state) when count > 0 do
    {elements, new_state} = do_pop(state, count)
    if elements == [] do
      {:reply, {:error, :empty_stack}, new_state}
    else
      {:reply, {:ok, elements}, new_state}
    end
  end

  def handle_call({:pop, _count}, _from, state), do: {:reply, {:error, :invalid_count}, state}

  # Helper Function for Recursive Pop

  defp do_pop(state, 0), do: {[], state}
  defp do_pop([], _count), do: {[], []}

  defp do_pop([head | tail], count) do
    {rest, new_state} = do_pop(tail, count - 1)
    {[head | rest], new_state}
  end
end
