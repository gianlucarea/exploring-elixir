defmodule Character do
  @moduledoc """
  Character

  Defines a character struct, and functions for creating character dialogue.

  iex> %Character{name: "Frodo"}
  %Character{name: "Frodo", weapon: nil, class: nil}

  The :name key is required.

  iex> %Character{name: "Frodo"}
  ** (ArgumentError) the following keys must also be given when building struct Character: [:name]
  """
  @enforce_keys :name
  defstruct [:name, :weapon, :class]

  @doc """
  Introduce the character by name.

  ## Examples

    iex> Character.introduce(%Character{name: "Gimli"})
    "My name is Gimli."

    iex> Character.introduce(%Character{name: "Aragorn"})
    "My name is Aragorn."
  """
  def introduce(character) do
    "My name is #{character.name}"
  end

  @doc """
  Declare a character attack.

  ## Examples

    iex> Character.attack(%Character{name: "Gimli", weapon: "axe"})
    "I attack with my axe!"

    iex> Character.attack(%Character{name: "Aragorn", weapon: "sword"})
    "I attack with my sword!"
  """
  def attack(character) do
    "I attack with my #{character.weapon}"
  end

  @doc """
  Declare a character's class.

  ## Examples

    iex> Character.class(%Character{name: "Gimli", class: "warrior"})
    "I am a warrior."

    iex> Character.class(%Character{name: "Aragorn", class: "ranger"})
    "I am a ranger."
  """
  def class(character) do
    "I am a #{character.class}"
  end

  @doc """
  Declare a character's name and class in a war cry.

  ## Examples

    iex> Character.war_cry(%Character{name: "Gimli", class: "warrior"})
    "My name is Gimli and I am a warrior!"

    iex> Character.war_cry(%Character{name: "Aragorn", class: "ranger"})
    "My name is Aragorn and I am a ranger!"
  """
  def war_cry(character) do
    introduce(character) <> " and " <> class(character)
  end

  @doc """
  Declare that one character has defeated another.

  ## Examples

    iex> Character.defeat(%Character{name: "Gimli"}, %Character{name: "Aragorn", class: "ranger"})
    "My name is Gimli and I have defeated the ranger Aragorn!"

    iex> Character.defeat(%Character{name: "Aragorn"}, %Character{name: "Gimli", class: "warrior"})
    "My name is Aragorn and I have defeated the warrior Gimli!"
  """
  def defeat(character1, character2) do
    "My name is #{character1.name} and I have defeated the #{character2.class} #{character2.name}"
  end

  def try() do
    gimli = %Character{name: "Gimli", class: "warrior", weapon: "axe"}
    aragorn = %Character{name: "Aragorn", class: "ranger", weapon: "sword"}
    gandalf = %Character{name: "Gandalf", class: "wizard", weapon: "staff"}

    Character.introduce(gimli) |> IO.inspect()
    Character.attack(gimli) |> IO.inspect()
    Character.class(gimli) |> IO.inspect()
    Character.war_cry(gimli) |> IO.inspect()
    Character.defeat(gandalf,aragorn) |> IO.inspect()
  end
end

Character.try()
