defmodule HabitTracker do
  @small 5
  @medium 20
  @large 30

  def count_total(total, small, medium, large) do
    total + (small * @small) + (medium * @medium) + (large * @large)
  end

  def progress_bar(goal, small, medium, large) do
    completed = count_total(0,small,medium,large)
    (completed / goal) * 100
  end

  #Large always late and Small always early
  def penalties_and_reward(small, medium, large) do
    small * reward(@small) + medium * @medium + large * penalties(@large)
  end

  defp penalties(value) do
    penalty = value / 2
    value - penalty
  end

  defp reward(value) do
    reward = (value / 100) * 60
    value + reward
  end

 end

HabitTracker.count_total(0,1,1,1) |> IO.inspect()
HabitTracker.count_total(0,10,5,3) |> IO.inspect()
HabitTracker.progress_bar(100,5,3,1) |> IO.inspect()
HabitTracker.penalties_and_reward(3,2,2) |> IO.inspect()
