defmodule ScoreTracker do
  @moduledoc """
  iex> {:ok, pid} = ScoreTracker.start_link([])
  iex> ScoreTracker.score(pid, 10)
  :ok
  iex> ScoreTracker.current_score(pid)
  10
  """
  use GenServer

  # Client API

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [])
  end

  def score(score_tracker_pid, amount) do
    GenServer.cast(score_tracker_pid,{:add_points,amount})
  end

  def current_score(score_tracker_pid) do
    GenServer.call(score_tracker_pid,:current_score)
  end

  # Server API

  def init(_init_arg) do
    {:ok, 0}
  end

  def handle_cast({:add_points, amount}, state) do
    {:noreply,state + amount}
  end

  def handle_call(:current_score, _from, state) do
    {:reply, state, state}
  end
end
