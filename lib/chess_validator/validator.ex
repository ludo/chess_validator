defmodule ChessValidator.Validator do
  def validate(board_file, moves_file) do
    board = load_file(board_file) |> parse_input(&Piece.parse/1)
    # moves = load_file(moves_file) |> parse_input(&parse_move/1)
  end

  def load_file(file) do
    {:ok, device} = File.open(file, [:read, :utf8])
    process_rows(device, [])
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
    row
    |> String.split(" ")
    |> process_fields([])
  end

  def process_fields([ head | tail ], accumulator) do
    process_fields(tail, accumulator ++ [head |> String.strip])
  end
  def process_fields([], accumulator), do: accumulator

  def parse_input(input, parser) do
    Enum.map(input, fn row -> row |> Enum.map(&split_chars/1) |> Enum.map(parser) end)
  end

  def split_chars(input) do
    { String.first(input), String.last(input) }
  end

  def parse_move(move) do
    move
  end
end
