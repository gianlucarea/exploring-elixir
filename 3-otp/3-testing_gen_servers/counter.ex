defmodule CountDown do
  use GenServer

  # Client
  def start_link(_opts) do
    GenServer.start_link(__MODULE__,1)
  end

  def decrement(pid) do
    GenServer.call(pid,:decrement)
  end

  # Server

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_call(:get_count, _from, state) do
    {:reply,state,state}
  end

  @impl true
  def handle_call(:decrement, _from, state) do
    {:reply, state-1, state-1}
  end
end

ExUnit.start(auto_run: false)

defmodule CounterTest do
  use ExUnit.Case

  # implement your test
  test "decrement/1" do
    {:ok, pid} = CountDown.start_link([])
    CountDown.decrement(pid)
    CountDown.decrement(pid)
    assert CounterMapExample.get_count(pid) == -1
  end

end

ExUnit.run()
