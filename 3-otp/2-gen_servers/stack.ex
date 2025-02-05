defmodule Stack do
  @moduledoc """
  iex> {:ok, pid} = Stack.start_link([])
  iex> :ok = Stack.push(pid, 1)
  iex> :ok = Stack.push(pid, 1)
  iex> Stack.pop(pid)
  1
  iex> Stack.pop(pid)
  nil
  """

  use GenServer

  def start_link(init_state) do
    GenServer.start_link(__MODULE__,init_state)
  end

  def push(stack_pid, element) do
    GenServer.cast(stack_pid,{:push,element})
  end

  def pop(stack_pid) do
    GenServer.call(stack_pid,:pop)
  end

  # Define the necessary Server callback functions:

  def init(state), do: {:ok, state}

  def handle_cast({:push,new_value}, state) do
    {:noreply, [new_value | state]}
  end

  def handle_call(:pop, _from, []) do
    {:reply, nil, []}
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head , tail}
  end
end
