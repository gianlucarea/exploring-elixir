defmodule FunFormulas do

  def calculate_percentage(items, total_items), do: (items/total_items) * 100

  def rocket_ship(mass,acceleration), do: mass * acceleration

  def leave_fifteenpercent_tip(cost_of_meal), do: (cost_of_meal / 100) * 15

  def pythagoreon_teorem(a,b), do: :math.pow(a,2) + :math.pow(b,2)

  def square_root(value), do: :math.sqrt(value)

end

FunFormulas.calculate_percentage(12,20) |> IO.inspect()
FunFormulas.rocket_ship(120,30) |> IO.inspect()
FunFormulas.leave_fifteenpercent_tip(123.5) |> IO.inspect()
FunFormulas.pythagoreon_teorem(3,4) |> IO.inspect()
FunFormulas.pythagoreon_teorem(3,4) |> FunFormulas.square_root() |> IO.inspect()
