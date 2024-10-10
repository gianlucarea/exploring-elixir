defmodule RockPaperScissors do

  def always_win() do
    player_choice = Enum.random([:rock, :paper, :scissors])
    IO.inspect(player_choice)
    case player_choice do
      :rock -> :paper
      :paper -> :scissors
      :scissors -> :rock
    end
  end

  def match({player1, player2}) do
    case {player1, player2} do
      {:rock, :scissors} -> "Player 1 Wins!"
      {:paper, :rock} -> "Player 1 Wins!"
      {:scissors, :paper} -> "Player 1 Wins!"
      {:rock, :paper} -> "Player 2 Wins!"
      {:paper, :scissors} -> "Player 2 Wins!"
      {:scissors, :rock} -> "Player 2 Wins!"
      _ -> "Draw"
    end
  end
end

RockPaperScissors.always_win() |> IO.inspect()
RockPaperScissors.match({:rock,:scissors}) |> IO.inspect()
RockPaperScissors.match({:scissors,:rock}) |> IO.inspect()
RockPaperScissors.match({:paper,:paper}) |> IO.inspect()
