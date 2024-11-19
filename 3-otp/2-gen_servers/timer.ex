defmodule Timer do
  @moduledoc """
  iex> {:ok, pid} = Timer.start_link([])
  iex> Timer.get_time(pid)
  0
  iex> Process.sleep(4200)
  iex> Timer.get_time(pid)
  4
  """
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__,[])
  end

  def get_time(timer_pid) do
    GenServer.call(timer_pid,:get_time)
  end

  def init(_opts) do
    scheduler()
    {:ok, 0}
  end

  def handle_info(:increment, state) do
    scheduler()
    {:noreply, state + 1}
  end

  def handle_call(:get_time,_from,state), do: {:reply,state,state}

  defp scheduler(), do: Process.send_after(self(),:increment,1000)
end
