defmodule ChessValidator.CLI do
  def run(argv) do
    parse_args(argv)
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
    ChessValidator.Validator.init_board(board)
    # ChessValidator.Validator.load_moves(moves)
  end
end
