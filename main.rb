# to do 190724
  # players choose color palette?
  # player top/bot chosen randomly? player_bot goes first
  # start game with pieces in default position

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

class Piece
  attr_accessor :id, :color, :side, :x, :y
  def initialize (id, side, x, y, board)
    @id = id
    @color = side[0]
    @side = side[1]
    @x, @y = x, y
    @board = board
    @board[@x, @y] = colorize(" #{@id} ")
  end
  
  def l; move(@x-1, @y+@side) end
  def r; move(@x+1, @y+@side) end
  
  ## move ul,ur,dl,dr to King class?
  # def ul; move(@x-1, @y-1) end
  # def ur; move(@x+1, @y-1) end
  def dl; move(@x-1, @y+1) end
  def dr; move(@x+1, @y+1) end

  # utility method :loc
  def loc; [@x, @y] end

  # takes dest args, sets origin blank, assigns colored string to array dest, assigns dest to piece's x,y
  def move(new_x, new_y)
    @board[@x, @y] = "   "
    @board[new_x, new_y] = colorize(" #{@id} ")
    # $board[new_x][new_y] = colorize(@id, @color)  # need a module that does this
    @x, @y = new_x, new_y
  end

  def jump (sender); end
  
  def crown; end
    
end # class Piece

class King < Piece

  def initialize(piece, board)
    @id = piece.id.upcase
    @color = piece.color
    @x, @y = piece.x, piece.y
    @board = board
    @board[@x, @y] = colorize("ᵕ#{@id}ᵕ")
  end

end # class King

# @board contains 8 row arrays
# each row array contains 4 positions + 4 blanks

class Board
  attr_accessor :board
  def initialize
    @board = Array.new(8) { Array.new(8) }
  
    @board.each_with_index do |col, index|
      n = index%2 == 0 ? 0 : 1
      col.map!.with_index do |sq, index|
        index%2 == n ? "░░░" : "   "
      end
    end
  end # class Board

  def render
    top = "   ╔" + "═══╦"*7 + "═══╗" 
    mid = "   ╠" + "═══╬"*7 + "═══╣"
    bot = "   ╚" + "═══╩"*7 + "═══╝"
    side = "║"
    print " "*4, "x", Array[*0..7].join("  x")
    print "\n", top, "\n"
    # loop for each of 8 row arrays
    @board[0..7].each_with_index do |row, index|
      print "y#{index} " + side
      row.each { |state| print state + side }
      print "\n", index == 7 ? bot : mid, "\n"
    end
  end

  # This allows you to change x,y by using @board[x, y] = val
  def []=(x, y, val)
    @board[y][x] = val
  end

end # class Board

# TESTING:
def coords_test
  boardxy = Array.new(8) { Array.new(8) }
  
  boardxy.each_with_index do |a, ai|
    a.each_with_index do |b, bi|
      boardxy[ai][bi] = [ai, bi]
    end
  end
end
pp coords_test

board = Board.new

c = Piece.new('c', $sides[0], 4, 7, board)
m = Piece.new('m', $sides[1], 3, 0, board)
m = King.new(m, board)
board.render
c.r
m.dl
board.render


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

