defmodule ChessValidator.CLI do
  def main(argv) do
    argv
    |> parse_args
    |> process
    |> IO.inspect
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv,
      switches: [ help: :boolean ],
      aliases: [ h: :help ]
    )

    case parse do
      { [ help: true ], _, _ } -> :help
      { _, [ board, moves ], _ } -> { board, moves }
      _ -> :help
    end
  end

  def process(:help) do
    IO.puts """
    usage:  chess_validator <board> <moves>
    """
    System.halt(0)
  end
  def process({board, moves}) do
    ChessValidator.Validator.validate(board, moves)
  end
end
