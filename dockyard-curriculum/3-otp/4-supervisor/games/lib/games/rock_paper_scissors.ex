defmodule Games.RockPaperScissors do

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
      {:rock, :scissors} ->
        Games.ScoreTracker.add_points(10)
        "You win! Rock beat Scissors!" |> IO.puts()
      {:paper, :rock} ->
        Games.ScoreTracker.add_points(10)
        "You win! Paper beat Rock!" |> IO.puts()
      {:scissors, :paper} ->
        Games.ScoreTracker.add_points(10)
        "You win! Scissors beat Paper!" |> IO.puts()
      {:rock, :paper} -> "You lose! Paper beat Rock!" |> IO.puts()
      {:paper, :scissors} -> "You lose! Scissors beat Paper!" |> IO.puts()
      {:scissors, :rock} -> "You lose! Rock beat Scissors!" |> IO.puts()
      _ -> "It's a tie!" |> IO.puts()
    end
  end
end
