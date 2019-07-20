
:ul :ur :dl :dr
    
move(@x+1, @y+1)

# phi 190719:
def move(new_x, new_y)
  $board[@y][@x] = "   "
  $board[new_y][new_x] = colorize(" #{@id} ")
  @x, @y = new_x, new_y
end

# check vacancy of next square
  # if occupied, checks vacancy of next.next square

# 

check_king