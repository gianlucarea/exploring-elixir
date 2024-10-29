defmodule Games do

alias Games.GuessingGame
alias Games.RockPaperScissors
alias Games.Wordle

  def main(args) do
   parsed_args = OptionParser.parse(args, switches: [game: :string])

   case parsed_args do
     {[game: "guessing"], _, _} -> GuessingGame.play()
     {[game: "rps"], _, _} -> RockPaperScissors.play()
     {[game: "wordle"], _, _} -> Wordle.play()
     _ -> game_loop()
   end
  end


  defp game_loop() do
    IO.puts("""
    What game would you like to play?
    1. Guessing Game
    2. Rock Paper Scissors
    3. Wordle
    Type "stop" to exit
    """)

    choice = IO.gets("Please enter your choice: ") |> String.trim()

    case choice do
      "1" ->
        GuessingGame.play()
      "2" ->
        RockPaperScissors.play()
      "3" ->
        Wordle.play()
      "stop" ->
        IO.puts("Goodbye! Thanks for playing!")
      _ ->
        IO.puts("Invalid choice, please try again.")
    end

    # After each game or invalid choice, loop back unless "stop" was chosen
    if choice != "stop" do
      game_loop()
    end
  end

  defmodule GuessingGame do

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
        {:rock, :scissors} -> "You win! Rock beat Scissors!" |> IO.puts()
        {:paper, :rock} -> "You win! Paper beat Rock!" |> IO.puts()
        {:scissors, :paper} -> "You win! Scissors beat Paper!" |> IO.puts()
        {:rock, :paper} -> "You lose! Paper beat Rock!" |> IO.puts()
        {:paper, :scissors} -> "You lose! Scissors beat Paper!" |> IO.puts()
        {:scissors, :rock} -> "You lose! Rock beat Scissors!" |> IO.puts()
        _ -> "It's a tie!" |> IO.puts()
      end
    end
  end

  defmodule Wordle do

    def play() do
      answer = Enum.random(["toast", "tarts", "hello", "beats","apple","house","plane","bread","table","tiger","clock"])
      max_attempts = 4
      loop_wordle(max_attempts,answer)
    end

    defp loop_wordle(max_attempts,answer) do
      guess = IO.gets("Enter a five letter word: ") |> String.trim() |> String.downcase()
      if String.length(guess) == 5 do
        result = feedback(answer, guess)
        case {result, max_attempts} do
          {[:green,:green,:green,:green,:green],_} -> IO.puts("Yes the answer was #{answer}")
          {_ , 0} -> IO.puts("You lose! the answer was #{answer}")
          {_,_} ->
            IO.inspect(result, label: "Nearly there ")
            loop_wordle(max_attempts-1,answer)
        end
      else
        IO.puts("#{guess} is not a five letter word")
      end

    end

    def test_feedback(answer, guess),do: feedback(answer,guess)

    defp feedback(answer, guess) do
        guess_list = String.graphemes(guess)
        target_list = String.graphemes(answer)
        greens = handle_greens(guess_list, target_list, [])
        yellows = handle_yellows(guess_list, target_list, greens, [])
        Enum.map(Enum.zip(greens,yellows), fn {value1, value2} ->
          case {value1,value2} do
            {:green,_} -> :green
            {_, :yellow} -> :yellow
            _ -> :grey
          end
        end)
    end

    defp handle_greens([],[], greens), do: Enum.reverse(greens)
    defp handle_greens([guess_letter | guess_tail], [target_letter | target_tail], greens) do
      if guess_letter == target_letter  do
        handle_greens(guess_tail, target_tail, [:green | greens])
      else
        handle_greens(guess_tail, target_tail, [:grey | greens])
      end
    end

    defp handle_yellows([], _target, _greens, yellows), do: Enum.reverse(yellows)
    defp handle_yellows([g | gs], target, [color | greens] , yellows) do
      cond do
        color == :green -> handle_yellows(gs, List.delete(target, g), greens,[:grey | yellows])
        Enum.member?(target, g) -> handle_yellows(gs, List.delete(target, g), greens, [:yellow | yellows])
        true ->  handle_yellows(gs, target, greens, [:grey | yellows])
      end
    end
  end

end
