
# # pseudocode:
# :render board -- prompt player_x
# gets "input" [ l, r, ul, ur, dl, dr ]
# convert "input" to appropriate vector based on piece type/color
# sends direction "dir" to :move # e.g. dir = ul =  
#   check state of next_sqare 1*vector => valid? vacant?
#     if :vacant? => :move to Dest => next :turn
#     if occupied => checks vacancy of next_sq
#       if next_sq.vacant? => :jump => 2*vector
#         => player_x moves :again
#       if occupied => :move_invalid

color0
color1
side
:$board.default
  # sets default state (alias :start ?)
:render
:turn(color, again?=false)
  # render
  # prompt for input (alt. prompt for second turn)
  # gets move input "l", "r", "ul", "ur", "dl", "dr"
  # checks for invalid input based on :is_king?
  # sends input to method
:l, :r (color/side)
  # gets converted to directional method based on color/side
    # eg. color0_piece.r = color0_piece.dr
    # eg. color1_piece.r = color1_piece.ur
:ul, :ur, :dl, :dr
  # 
:vector(piece, input) #=> piece, [x_vect, y_vect]
  # convert input to vector based on piece type/color
:nav(piece, vector)
  # checks for vacancy
  # checks for jump
  # checks for board edge (necessary?)
  # sends 'dest' to :move
dest
:jump? #=> boolean?
  # 
:move(piece, dest, jump?=false)
  # updates $board: origin & dest
  # updates piece loc
:again #=> boolean?
  # runs :turn for same color, with different prompt
:crown


# $board[y] = x
# $board[y][x] = y

# [a,b] = [change in x axis, change in y axis]
ul = [-1,-1]
ur = [+1,-1]
dl = [-1,-1]
dr = [-1,+1]
def l
  if @color == color0 ? 

# phi 190719:
def move(new_x, new_y)
  $board[@y][@x] = "   "
  $board[new_y][new_x] = colorize(" #{@id} ")
  @x, @y = new_x, new_y
end

def jump

def
  

check_king
