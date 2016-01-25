defmodule Move do
  defstruct src: [0,0], dest: [0,0]

  def execute(move, board) do
    src_x = Enum.at(move.src, 0)
    src_y = Enum.at(move.src, 1)
    dest_x = Enum.at(move.dest, 0)
    dest_y = Enum.at(move.dest, 1)

    piece = board |> Enum.at(src_y) |> Enum.at(src_x)

    updated_dest_row = board
                       |> Enum.at(dest_y)
                       |> List.replace_at(dest_x, piece)

    updated_src_row =  board
                       |> Enum.at(src_y)
                       |> List.replace_at(src_x, nil)

    board
    |> List.replace_at(src_y, updated_src_row)
    |> List.replace_at(dest_y, updated_dest_row)
    # |> Board.pretty_print
  end

  def parse([src, dest]) do
    %Move{ src: to_coords(src), dest: to_coords(dest) }
  end

  defp to_coords(cell) do
    chars = cell |> String.to_char_list
    [chars |> get_x, chars |> get_y]
  end

  defp get_x(cell) do
    (cell |> Enum.at(0)) - 97
  end

  defp get_y(cell) do
    (cell |> Enum.at(1)) - 49
  end
end
