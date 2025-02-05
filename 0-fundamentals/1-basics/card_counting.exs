defmodule CardCounting do
  @low -1
  @normal 0
  @high 1

  def high_card(inital_count), do: inital_count + @high
  def low_card(initial_count), do: initial_count + @low

  def multiple_cards(initial_count, num_high, num_low, num_normal) do
    initial_count + (@high * num_high) + (@low * num_low) + (@normal * num_normal)
  end

  def random_multiple_cards(initial_state) do
      random_card1 = Enum.random(1..13)
      random_card2 = Enum.random(1..13)
      random_card3 = Enum.random(1..13)
      cards =
        Enum.map([random_card1, random_card2, random_card3], fn random_card ->
          cond do
            random_card <= 6 -> @low
            random_card >= 10 -> @high
            true -> @normal
          end
        end)
      IO.inspect(cards)
      initial_state + Enum.sum(cards)
  end

end

CardCounting.high_card(10) |> IO.inspect()
CardCounting.low_card(5) |> IO.inspect()

CardCounting.multiple_cards(5,3,2,2) |> IO.inspect()
CardCounting.random_multiple_cards(10) |> IO.inspect()
