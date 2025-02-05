defmodule Games.Wordle do
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
        {[:green,:green,:green,:green,:green],_} ->
          Games.ScoreTracker.add_points(25)
          IO.puts("Yes the answer was #{answer}")
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
