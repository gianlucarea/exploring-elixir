defmodule Todo.System do
  use Supervisor

  def init(_) do
    Supervisor.start_link([Todo.Cache], strategy: :one_for_one)
  end

end
