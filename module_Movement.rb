
module Movement

  # $board[y] == x
  # $board[y][x] == y

  def ul; [-1,-1] end
  def ur; [+1,-1] end
  def dl; [-1,-1] end
  def dr; [-1,+1] end

  def l; @color == color0 ? dl : ul end
  def r; @color == color0 ? dr : ur end

  # phi 190719:
  def move(new_x, new_y)
    $board[@y][@x] = "   "
    $board[new_y][new_x] = colorize(" #{@id} ")
    @x, @y = new_x, new_y
  end

end # module Movement

include Colorize
include Checkers
include Movement

module Checkers
  def new_game end

  def choose_color end

