defmodule GuessingGame do

  @num_answer Enum.random(1..10)

  def guess_the_word(guess,answer) do
    cond do
      guess == answer -> "Correct"
      true -> "Incorrect"
    end
  end

  def guess_the_word(guess) do
    answer = Enum.random(["Love","Hate","Like","Dislike"])
    guess_the_word(guess,answer)
  end

  def guess_the_number(guess,answer) do
    cond do
      guess == answer -> "Correct"
      guess < answer -> "Too low!"
      guess > answer -> "Too high!"
    end
  end

  def guess_the_number(guess) do
    guess_the_number(guess,@num_answer)
  end

  def printLine(), do: "-------"
end

GuessingGame.guess_the_word("Love","Love") |> IO.inspect()
GuessingGame.guess_the_word("Love","Hate") |> IO.inspect()
GuessingGame.guess_the_word("Love") |> IO.inspect()
GuessingGame.guess_the_number(5,5) |> IO.inspect()
GuessingGame.guess_the_number(5,6) |> IO.inspect()
GuessingGame.guess_the_number(5,4) |> IO.inspect()
GuessingGame.printLine() |> IO.inspect
GuessingGame.guess_the_number(1) |> IO.inspect()
GuessingGame.guess_the_number(2) |> IO.inspect()
GuessingGame.guess_the_number(3) |> IO.inspect()
GuessingGame.guess_the_number(4) |> IO.inspect()
GuessingGame.guess_the_number(5) |> IO.inspect()
GuessingGame.guess_the_number(6) |> IO.inspect()
GuessingGame.guess_the_number(7) |> IO.inspect()
GuessingGame.guess_the_number(8) |> IO.inspect()
GuessingGame.guess_the_number(9) |> IO.inspect()
GuessingGame.guess_the_number(10) |> IO.inspect()
