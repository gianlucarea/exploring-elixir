defmodule Fraction do
  defstruct a: nil, b: nil

  def new(a, b) do
    %Fraction{a: a , b: b}
  end

  def value(%Fraction{a: a, b: b}) do
    a / b
  end

  def value_dot_notation(fraction) do
    fraction.a / fraction.b
  end

  def add(fraction1 , fraction2) do
    new((fraction1.a * fraction2.b) + (fraction2.a * fraction1.b),fraction1.b * fraction2.b)
  end

end

Fraction.new(3,2) |> IO.inspect()
Fraction.new(3,2) |> Fraction.value() |> IO.inspect()
Fraction.new(3,2) |> Fraction.value_dot_notation() |> IO.inspect()
Fraction.new(3,2) |> Fraction.value_dot_notation() |> IO.inspect()
Fraction.new(3,2) |> Fraction.add(Fraction.new(4,4)) |> IO.inspect() |> Fraction.value() |> IO.inspect()
