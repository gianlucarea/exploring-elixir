defmodule TicTacToe do
  def at(board, coordinate) do
    {x, y} = coordinate
    Enum.at(board, 2 - y) |> Enum.at(x)
  end

  def fill(board, coordinate, symbol) do
    {x, y} = coordinate
    List.update_at(board, 2 - y, fn row -> List.replace_at(row, x, symbol) end)
  end

  def winner(board) do
    cond do
      winner?(board, "X") -> "X"
      winner?(board, "O") -> "O"
      true -> nil
    end
  end

  def winner?(board, symbol) do
    row_winner =
      Enum.any?(board, fn row ->
        Enum.all?(row, fn element -> element == symbol end)
      end)

    column_winner =
      Enum.any?(0..2, fn index ->
        Enum.all?(board, fn row ->
          Enum.at(row, index) == symbol
        end)
      end)

    diagonal_winner =
      Enum.all?(0..2, fn index ->
        board
        |> Enum.at(index)
        |> Enum.at(index) == symbol
      end) or
        Enum.all?(0..2, fn index ->
          board
          |> Enum.at(index)
          |> Enum.at(2 - index) == symbol
        end)

    row_winner or column_winner or diagonal_winner
  end
end
