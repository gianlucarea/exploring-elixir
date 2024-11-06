defmodule Pokemon do

  defstruct [:name, :type, :health, :attack, :speed]

  def attack(attacker, defender) do
    damage = attacker.attack * modifier(attacker.type, defender.type)
    %__MODULE__{defender | health: defender.health - damage}
  end

  defp modifier(attacker_type, defender_type) do
    cond do
      super_effective?(attacker_type, defender_type) -> 2
      super_effective?(defender_type, attacker_type) -> 0.5
      true -> 1
    end
  end

  defp super_effective?(attacker_type, defender_type) do
    {attacker_type, defender_type} in [{:fire, :grass}, {:grass, :water}, {:water, :fire}]
  end

  def try() do
    charmander = %Pokemon{name: "Charmander", type: :fire, health: 20.0, attack: 5, speed: 20}
    bulbasaur = %Pokemon{name: "Bulbasaur", type: :grass, health: 20.0, attack: 5, speed: 20}
    squirtle = %Pokemon{name: "Squirtle", type: :water, health: 20, attack: 5, speed: 20}
    charmander |> IO.inspect()
    bulbasaur |> IO.inspect()
    squirtle |> IO.inspect()
    Pokemon.attack(charmander, bulbasaur) |> IO.inspect()

  end
end

Pokemon.try()
