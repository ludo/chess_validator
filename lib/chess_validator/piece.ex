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
  def print(%Piece{color: :white, type: :king}), do: "\x{2654}"
  def print(%Piece{color: :white, type: :queen}), do: "\x{2655}"
  def print(%Piece{color: :white, type: :rook}), do: "\x{2656}"
  def print(%Piece{color: :white, type: :bishop}), do: "\x{2657}"
  def print(%Piece{color: :white, type: :knight}), do: "\x{2658}"
  def print(%Piece{color: :white, type: :pawn}), do: "\x{2659}"
  def print(%Piece{color: :black, type: :king}), do: "\x{265A}"
  def print(%Piece{color: :black, type: :queen}), do: "\x{265B}"
  def print(%Piece{color: :black, type: :rook}), do: "\x{265C}"
  def print(%Piece{color: :black, type: :bishop}), do: "\x{265D}"
  def print(%Piece{color: :black, type: :knight}), do: "\x{265E}"
  def print(%Piece{color: :black, type: :pawn}), do: "\x{265F}"
end
