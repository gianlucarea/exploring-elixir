defmodule Todo.Database do
  use GenServer

  @db_folder "./persist"

  def start do
    GenServer.start(__MODULE__, nil, name: __MODULE__)
  end

  def store(key, data) do
    key |> get_worker() |> Todo.DatabaseWorker.store(key, data)
  end

  def get(key) do
    key |> get_worker() |> Todo.DatabaseWorker.get(key)
  end

  @impl GenServer
  def init(_) do
    File.mkdir_p!(@db_folder)
    {:ok, start_workers()}
  end

  defp start_workers() do
    for index <- 1..3, into: %{} do
      {:ok, pid} = Todo.DatabaseWorker.start(@db_folder)
      {index - 1, pid}
    end
  end

  defp get_worker(pid) do
    GenServer.call(__MODULE__,{:choose_worker, pid})
  end

  @impl GenServer
  def handle_call({:choose_worker, pid}, _, workers) do
    worker_key = :erlang.phash2(pid,3)
    {:reply, Map.get(workers,worker_key), workers}
  end
end
