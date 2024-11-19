defmodule MultiplayerScoreTracker do
  @moduledoc """
  iex> {:ok, pid} = MultiplayerScoreTracker.start_link([])
  iex> :ok = MultiplayerScoreTracker.add_points(pid, :player1, 10)
  iex> :ok = MultiplayerScoreTracker.add_points(pid, :player1, 20)
  iex> :ok = MultiplayerScoreTracker.add_points(pid, :player2, 20)
  iex> MultiplayerScoreTracker.all_scores(pid)
  %{
    player1: 30,
    player2: 20
  }
  iex> MultiplayerScoreTracker.current_score(pid, :player1)
  30
  """
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [])
  end

  def add_points(multiplayer_score_tracker_pid, player_name, amount) do
    GenServer.cast(multiplayer_score_tracker_pid,{:add_points, player_name, amount})
  end

  def all_scores(multiplayer_score_tracker_pid) do
    GenServer.call(multiplayer_score_tracker_pid, :all_scores)
  end

  def current_score(multiplayer_score_tracker_pid, player_name) do
    GenServer.call(multiplayer_score_tracker_pid, {:current_score, player_name})
  end

  def handle_cast({:add_points, player_name, amount}, state) do
    {:noreply, Map.update(state,player_name,amount,fn value -> value + amount  end)}
  end

  def handle_call(:all_scores, _from, state) do
    {:reply,state,state}
  end

  def handle_call({:current_score, player_name}, _from, state) do
    {:reply,state[player_name],state}
  end

  def init(_opts), do: {:ok, %{}}
end
