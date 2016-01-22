defmodule ChessValidator.Validator do
  def init_board(file) do
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
    process_fields(tail, accumulator ++ [head |> String.strip |> process_field])
  end
  def process_fields([], accumulator) do
    accumulator
  end

  def process_field(field) do
    if field == "--", do: nil, else: String.to_atom(field)
  end
end
