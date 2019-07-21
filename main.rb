# outline brainstorm 190719
  # players choose color palette?
      # player top/bot chosen randomly? player_bot goes first
  # RENDER board with default states
      # (or with each piece in default state)
  # EACH TURN
      # rotate board?
      # take input
      # change board state (or piece state)
          # unless move invalid
          # unless input invalid
      # king if dest y = 0 || 7 depending on color ; render    
      # additional turn if appl. ; render
        # repeat checks as needed
      # change turn ; render


# black , red , green , yellow , blue , pink , light_blue , gray , bg_red, bg_light_blue , bg_pink

require_relative 'module_colorize.rb'
include Colorize 

$sides = [["pink", -1], ["blue", 1]]

# class Player
  #   # def player.color with attr_accessor? call that from piece methods?
  #   attr_accessor :name, :turn #add :color, :pos ?

  #   def initialize (name, color, turn, pos) # pos = 1 || -1...
  #     @name = name
  #     @color = color
  #     @turn = turn
  #     @pos = pos
  #   end

# end # class Player

class Piece 
  # creates instance methods p.color, p.color=, p.x, p.x=, etc ?
  attr_accessor :id, :color, :side, :x, :y 
  
  def initialize (id, side, x, y)
    @id = id
    @color = side[0]
    @side = side[1]
    @x, @y = x, y
    $board[y][x] = colorize(" #{@id} ")
  end

  # multiply y based on piece color [1,-1]
  # check 

  def l
    move(@x-1, @y+@side)
  end

  def r
    move(@x+1, @y+@side)
  end

  def dl
    move(@x-1, @y+1)
  end
  
  def dr
    move(@x+1, @y+1)
  end

  # utility method:
  def loc; [@x, @y] end

  # takes dest args, sets origin blank, assigns colored string to array dest, assigns dest to piece's x,y
  def move(new_x, new_y)
    $board[@y][@x] = "   "
    $board[new_y][new_x] = colorize(" #{@id} ")
    # $board[new_x][new_y] = colorize(@id, @color)  # need a module that does this
    @x, @y = new_x, new_y
  end

  def jump (sender)
  end

  def crown
  end

end # class Piece

# King inherits l and r, we can still use those
  # thinking of user input. and minimizing methods


# l / r and ul / ur / dl / dr
# or
# ul / ur / dl / dr --> for normal pieces, color0 uses dl/dr & color1 uses ul/ur
  # def l
  #   (!@king && @color == color-1) ? dl : ul  this requires adding two methods to each class

  # seems like we'd need a sort of translator method (or 2) for King to use l / r
  # ul / ur / dl / dr approach also requires translating 'l' 'r' input & mult. by (1, -1) but maybe more intuitive to code?
    # ul is always -1,-1. 
    # color1.l == color1.ul
    # color0.l == color0.dl
    # i'm probably missing something
  

class King < Piece
  # inherited:
    # attr_accessor *___
    # initialize
    # :l :r
    # move
  def initialize(piece)
    @id = piece.id
    @color = piece.color
    @x, @y = piece.x, piece.y
    $board[y][x] = colorize("ᵕ#{@id.upcase}ᵕ")
  end

end # class King

# $board contains 8 row arrays
# each row array contains 4 positions + 4 blanks

# "The board should be placed so that there is a light corner square nearest each player’s right-hand side and a dark corner square nearest each player’s left-hand side."

$board = Array.new(8) {Array.new(8)}
$board.each_with_index do |row, index|
  n = index%2 == 0 ? 1 : 0
  row.map!.with_index do |sq, index|
    index%2 == n ? "░░░" : "   "
  end
end

#
  # r = []
  # r[0] = (" a ".." h ").to_a
  # r[1] = (" i ".." p ").to_a.each { |p| p = p.gray }
  # r[2] = r[0].map { |p| p = p.light_blue }
  # r[3] = r[1].map { |p| p = p.black.bg_red }
  # r[4] = r[0].map { |p| p = p.yellow }
  # r[5] = r[1].map { |p| p = p.pink }
  # r[6] = r[0].map { |p| p = p.black.bg_light_blue }
  # r[7] = r[1].map { |p| p = p.black.bg_pink }


# rendering:

def render(board_arr)
  top = "  ╔" + "═══╦"*7 + "═══╗" 
  mid = "  ╠" + "═══╬"*7 + "═══╣"
  bot = "  ╚" + "═══╩"*7 + "═══╝"
  side = "║"
  print " "*4, Array[*0..7].join("   ")
  print "\n", top, "\n"
  # loop for each of 8 row hashes
  board_arr[0..7].each_with_index do |row, index|
    print "#{index} " + side
    row.each do |state|             
      print state + side
    end
    
    print "\n", index == 7 ? bot : mid, "\n"
  end
end

c = Piece.new("c", $sides[0], 3, 7)
m = Piece.new("m", $sides[1], 2, 0)
m = King.new(m)

p c.loc
p c.side

render($board)
m.dr
c.l
render($board)

#
  # a = " a ".black.bg_light_blue
  # b = " b ".black.bg_light_blue
  # m = " m ".black.bg_pink
  # N = "<N>".black.bg_pink   # King?
  # M = "ᵕMᵕ".black.bg_pink
  # N = " N ".black.bg_pink.bold.underline   # King?

  # puts
  # puts "╔═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╗"
  # puts "║#{a}║░░░║   ║░░░║#{b}║░░░║#{N}║░░░║"
  # puts "╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣"
  # puts "║░░░║   ║░░░║#{m}║░░░║#{M}║░░░║   ║"
  # puts "╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣"


  # top1, top2, top3 = "╔═══" , "╦═══" , "╗" 
  # spa1, spa2, spa3 = "║#{s}", "║#{s}", "║"
  # mid1, mid2, mid3 = "╠═══" , "╬═══" , "╣"
  # bot1, bot2, bot3 = "╚═══" , "╩═══" , "╝"

  # ╔═══╦═══╗
  # ║(A)║(b)║
  # ╠═══╬═══╣
  # ║ c ║ d ║
  # ╚═══╩═══╝
#
#        0     1     2     3     4     5     6     7
#      -----------------------------------------------
#   0-| 0,0 | 1,0 | 2,0 | 3,0 | 4,0 | 5,0 | 6,0 | 7,0 |
#      -----------------------------------------------
#   1-| 0,1 | 1,1 | 2,1 | 3,1 | 4,1 | 5,1 | 6,1 | 7,1 |
#      -----------------------------------------------
#   2-| 0,2 | 1,2 | 2,2 | 3,2 | 4,2 | 5,2 | 6,2 | 7,2 |
#      -----------------------------------------------
#   3-| 0,3 | 1,3 | 2,3 | 3,3 | 4,3 | 5,3 | 6,3 | 7,3 |
#      -----------------------------------------------
#   4-| 0,4 | 1,4 | 2,4 | 3,4 | 4,4 | 5,4 | 6,4 | 7,4 |
#      -----------------------------------------------
#   5-| 0,5 | 1,5 | 2,5 | 3,5 | 4,5 | 5,5 | 6,5 | 7,5 |
#      -----------------------------------------------
#   6-| 0,6 | 1,6 | 2,6 | 3,6 | 4,6 | 5,6 | 6,6 | 7,6 |
#      -----------------------------------------------
#   7-| 0,7 | 1,7 | 2,7 | 3,7 | 4,7 | 5,7 | 6,7 | 7,7 |
#      -----------------------------------------------

# >> [3, 7]
# >> -1
# >>     0   1   2   3   4   5   6   7
# >>   ╔═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╗
# >> 0 ║   ║░░░║\e[46m\e[30mᵕMᵕ\e[0m\e[0m║░░░║   ║░░░║   ║░░░║
# >>   ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
# >> 1 ║░░░║   ║░░░║   ║░░░║   ║░░░║   ║
# >>   ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
# >> 2 ║   ║░░░║   ║░░░║   ║░░░║   ║░░░║
# >>   ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
# >> 3 ║░░░║   ║░░░║   ║░░░║   ║░░░║   ║
# >>   ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
# >> 4 ║   ║░░░║   ║░░░║   ║░░░║   ║░░░║
# >>   ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
# >> 5 ║░░░║   ║░░░║   ║░░░║   ║░░░║   ║
# >>   ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
# >> 6 ║   ║░░░║   ║░░░║   ║░░░║   ║░░░║
# >>   ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
# >> 7 ║░░░║   ║░░░║\e[45m\e[30m c \e[0m\e[0m║░░░║   ║░░░║   ║
# >>   ╚═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╝
# >>     0   1   2   3   4   5   6   7
# >>   ╔═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╗
# >> 0 ║   ║░░░║   ║░░░║   ║░░░║   ║░░░║
# >>   ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
# >> 1 ║░░░║   ║░░░║\e[46m\e[30m m \e[0m\e[0m║░░░║   ║░░░║   ║
# >>   ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
# >> 2 ║   ║░░░║   ║░░░║   ║░░░║   ║░░░║
# >>   ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
# >> 3 ║░░░║   ║░░░║   ║░░░║   ║░░░║   ║
# >>   ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
# >> 4 ║   ║░░░║   ║░░░║   ║░░░║   ║░░░║
# >>   ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
# >> 5 ║░░░║   ║░░░║   ║░░░║   ║░░░║   ║
# >>   ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
# >> 6 ║   ║░░░║\e[45m\e[30m c \e[0m\e[0m║░░░║   ║░░░║   ║░░░║
# >>   ╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣
# >> 7 ║░░░║   ║░░░║   ║░░░║   ║░░░║   ║
# >>   ╚═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╝
