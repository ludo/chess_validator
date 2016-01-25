defmodule Board do
  def pretty_print(board) do
    board
    |> Enum.map(fn row -> row |> Enum.map(&Piece.print/1) end)
  end
end
