defmodule ChessValidator.Validator do
  def validate(board_file, moves_file) do
    board = load_board_from_file(board_file)

    load_moves_from_file(moves_file)
    |> Move.execute(board)
  end

  defp load_board_from_file(file) do
    {:ok, board} = File.open(file, [:read, :utf8])

    board
    |> process_rows([])
    |> Enum.map(fn row -> row |> Enum.map(&Piece.parse/1) end)
  end

  defp load_moves_from_file(file) do
    {:ok, moves} = File.open(file, [:read, :utf8])

    moves
    |> process_rows([])
    |> Enum.map(&Move.parse/1)
  end

  defp process_rows(device, accumulator) do
    case IO.read(device, :line) do
      :eof ->
        File.close(device)
        accumulator
      row -> process_rows(device, accumulator ++ [process_row(row)])
    end
  end

  defp process_row(row) do
    row |> String.strip |> String.split
  end
end
