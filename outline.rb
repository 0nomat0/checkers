
start
render
gets
interpret
move
render
next_turn

# object list -- roughly linear.  not totally clear on where each method should be defined.

module Movement
module Colorize
class Piece
class King
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
  # calls direction method based on input
:l, :r (color/side)
  # gets converted to directional method based on color/side
    # eg. color0_piece.r = color0_piece.dr
    # eg. color1_piece.r = color1_piece.ur
:ul, :ur, :dl, :dr
  # 
:vector(piece, input) #=> piece, [vect_x, vect_y]
  # convert input to vector based on piece type/color
:dest(piece, vector)
  # checks for vacancy
  # checks for jump
  # checks for board edge (necessary?)
  #=> returns dest -- [new_x, new_y] -- for :move
:jump? #=> boolean?
  # if jump? -- :mult vector *2
:move(piece, dest, jump?=false)
  # updates $board: origin & dest
  # updates piece loc
:again #=> boolean?
  # runs :turn for same color, with different prompt
:crown



# pseudocode:
:render board -- prompt player_x
gets "input" [ l, r, ul, ur, dl, dr ]
convert "input" to appropriate vector based on piece type/color
sends direction "dir" to :move # e.g. dir = ul =  
  check state of next_sqare 1*vector => valid? vacant?
    if :vacant? => :move to Dest => next :turn
    if occupied => checks vacancy of next_sq
      if next_sq.vacant? => :jump => 2*vector
        => player_x moves :again
      if occupied => :move_invalid
