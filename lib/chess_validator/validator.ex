defmodule ChessValidator.Validator do
  def validate(board_file, moves_file) do
    {:ok, board} = File.open(board_file, [:read, :utf8])

    board
    |> process_rows([])
    |> Enum.map(fn row -> row |> parse_input(&Piece.parse/1) end)

    {:ok, moves} = File.open(moves_file, [:read, :utf8])

    moves
    |> process_rows([])
    |> Enum.map(&Move.parse/1)
  end

  def process_rows(device, accumulator) do
    case IO.read(device, :line) do
      :eof ->
        File.close(device)
        accumulator
      row -> process_rows(device, accumulator ++ [process_row(row)])
    end
  end

  def process_row(row) do
    row |> String.strip |> String.split
  end

  def parse_input(input, parser) do
    input
    |> Enum.map(&split_chars/1)
    |> Enum.map(parser)
  end

  def split_chars(input) do
    { String.first(input), String.last(input) }
  end
end
