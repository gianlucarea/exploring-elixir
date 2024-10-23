defmodule Games do
  @moduledoc """
  Documentation for `Games`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Games.hello()
      :world

  """
  defmodule GuessingGame do

    def play() do
      guess_number = Enum.random(1..10)
      IO.puts(guess_number)
      max_attempts = 5
      loop(max_attempts,guess_number)
    end

    def loop(max_attempts,guess_number) do
      {input,_} = IO.gets("Guess a number between 1 and 10: ") |> Integer.parse()
      cond do
        max_attempts == 0 -> IO.puts("You lose! the answer was #{guess_number}")
        input > guess_number ->
          IO.puts("To High")
          loop(max_attempts-1,guess_number)
        input < guess_number ->
          IO.puts("To Low")
          loop(max_attempts-1,guess_number)
        input == guess_number ->
          IO.puts("You Win!")
      end
    end
  end

  defmodule RockPaperScissors do
    def play() do
      input = IO.gets("Choose rock, paper, or scissors: ") |> String.trim() |> String.downcase() |> String.to_atom()
      answer = Enum.random([:rock,:paper,:scissors])
      case input do
        :rock -> match({input,answer})
        :paper -> match({input,answer})
        :scissors -> match({input,answer})
          _ -> "NOT VALID CHOICE!"
      end
    end

    def match({input,answer}) do
      case {input,answer} do
        {:rock, :scissors} -> "You win! Rock beat Scissors!"
        {:paper, :rock} -> "You win! Paper beat Rock!"
        {:scissors, :paper} -> "You win! Scissors beat Paper!"
        {:rock, :paper} -> "You lose! Paper beat Rock!"
        {:paper, :scissors} -> "You lose! Scissors beat Paper!"
        {:scissors, :rock} -> "You lose! Rock beat Scissors!"
        _ -> "It's a tie!"
      end
    end
  end


  def hello do
    :world
  end
end
