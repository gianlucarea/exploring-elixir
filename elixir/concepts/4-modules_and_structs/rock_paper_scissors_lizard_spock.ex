defmodule RockPaperScissorsLizardSpock do
  @doc """
  ## Examples

      iex> RockPaperScissorsLizardSpock.beats?(:lizard, :spock)
      true
      iex> RockPaperScissorsLizardSpock.beats?(:lizard, :paper)
      true
      iex> RockPaperScissorsLizardSpock.beats?(:spock, :scissors)
      true
      iex> RockPaperScissorsLizardSpock.beats?(:spock, :rock)
      true
      iex> RockPaperScissorsLizardSpock.beats?(:spock, :paper)
      false
  """
  def beats?(guess1, guess2) do
    case {guess1, guess2} do
      {:rock, :scissors} -> true
      {:rock, :lizard} -> true
      {:paper, :rock} -> true
      {:paper, :spock} -> true
      {:scissors, :paper} -> true
      {:scissors, :lizard} -> true
      {:lizard, :spock} -> true
      {:lizard, :paper} -> true
      {:spock, :scissors} -> true
      {:spock, :rock} -> true
      _ -> false
    end
  end
  @doc """
  ## Examples

      iex> "Player 1 Wins!" = RockPaperScissorsLizardSpock.play(:rock, :lizard)
      iex> "Player 2 Wins!" = RockPaperScissorsLizardSpock.play(:lizard, :rock)
      iex> "Draw!" = RockPaperScissorsLizardSpock.play(:lizard, :lizard)
  """
  def play(player1, player2) do
    cond do
      beats?(player1, player2) -> "Player 1 Wins!"
      beats?(player2, player1) -> "Player 2 Wins!"
      true -> "Draw!"
    end
  end
end

RockPaperScissorsLizardSpock.play(:rock,:lizard) |> IO.inspect()
RockPaperScissorsLizardSpock.play(:spock,:lizard) |> IO.inspect()
RockPaperScissorsLizardSpock.play(:spock,:spock) |> IO.inspect()
