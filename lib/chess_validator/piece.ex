defmodule Piece do
  # colors: black, white
  # types: pawn, knight, bishop, rook, queen, king
  defstruct color: :black, type: :pawn

  def parse("--"), do: nil
  def parse(piece_str) do
    %Piece{
      color: parse_color(String.first(piece_str)),
      type: parse_type(String.last(piece_str))
    }
  end

  def parse_color(color) do
    case color do
      "b" -> :black
      "w" -> :white
      _ ->
        IO.puts "Unknown color '#{color}'"
        System.halt(1)
    end
  end

  def parse_type(type) do
    case type do
      "B" -> :bishop
      "K" -> :king
      "N" -> :knight
      "P" -> :pawn
      "Q" -> :queen
      "R" -> :rook
      _ ->
        IO.puts "Unknown type '#{type}'"
        System.halt(1)
    end
  end

  def print(nil), do: " "
  def print(%Piece{color: :white, type: :king}), do: "\u2654"
  def print(%Piece{color: :white, type: :queen}), do: "\u2655"
  def print(%Piece{color: :white, type: :rook}), do: "\u2656"
  def print(%Piece{color: :white, type: :bishop}), do: "\u2657"
  def print(%Piece{color: :white, type: :knight}), do: "\u2658"
  def print(%Piece{color: :white, type: :pawn}), do: "\u2659"
  def print(%Piece{color: :black, type: :king}), do: "\u265A"
  def print(%Piece{color: :black, type: :queen}), do: "\u265B"
  def print(%Piece{color: :black, type: :rook}), do: "\u265C"
  def print(%Piece{color: :black, type: :bishop}), do: "\u265D"
  def print(%Piece{color: :black, type: :knight}), do: "\u265E"
  def print(%Piece{color: :black, type: :pawn}), do: "\u265F"
end
