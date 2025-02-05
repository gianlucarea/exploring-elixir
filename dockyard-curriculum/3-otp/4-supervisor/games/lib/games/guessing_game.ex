defmodule Games.GuessingGame do

  def play() do
    guess_number = Enum.random(1..10)
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
        Games.ScoreTracker.add_points(10)
        IO.puts("You Win!")
    end
  end
end
