defprotocol Character do
  def can_attack?(character, origin, target)
end

defmodule Wizard do
  defstruct []
end

defmodule Barbarian do
  defstruct []
end

defmodule Archer do
  defstruct []
end

defimpl Character, for: Barbarian do
  def can_attack?(_character,{final_x,final_y},{start_x,start_y}) do
    x = final_x - start_x
    y = final_y - start_y
    abs(x) <= 2 && abs(y) <= 2
  end
end

defimpl Character, for: Wizard do
  def can_attack?(_character,{final_x,final_y},{start_x,start_y}) do
    x = final_x - start_x
    y = final_y - start_y
    final_x == start_x || final_y == start_y ||  abs(x) == abs(y)
  end
end

defimpl Character, for: Archer do
  def can_attack?(_character,{final_x,final_y},{start_x,start_y}) do
    x = final_x - start_x
    y = final_y - start_y
    abs(x) <= 3 && abs(y) <= 3
  end
end
