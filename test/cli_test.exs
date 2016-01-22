defmodule CliTest do
  use ExUnit.Case

  import ChessValidator.CLI, only: [ parse_args: 1 ]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "two values returned if two given" do
    assert parse_args(["board.txt", "moves.txt"]) == { "board.txt", "moves.txt" }
  end
end
