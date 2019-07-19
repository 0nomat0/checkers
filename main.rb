
# linear flow:
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
      # (additional turn if appl.)    
      # (king if dest y = 0 || 7 depending on color)
      # (repeat checks as needed)
      # update collection(s)

# movement:
  # player_top will move y+1, x+/-1
  # player_bot will move y-1, x+/-1
  
  # def top_input ____for example_______
    # piece and move is :gets --> 'p.l'
    # corresponding array object = [x][y]
    # (lookup with hash[p] = x,y ?)
    # check dest for vacancy: (x2,y2) || (x3,y3)
    # assign "__" to origin r[x][y]
      # and to piece jumped if appl.
    # assign p to dest r[x][y]
    # check for doublejump
    # next player's turn or :gets doublejump

# black , red , green , yellow , blue , pink , light_blue , gray , bg_red, bg_light_blue , bg_pink

require_relative 'string_colorize.rb'

class Player
  attr_accessor :turn

  def initialize (color, turn)
    @color = color
    @turn = turn
  end
end # class Player

class Piece
  attr_accessor :color, :x, :y
  
  def initialize (name, color, x, y)
    @name = name
    @color = color
    @x = x
    @y = y
    $board[x][y] = colorize(" #{@name} ")
  end

  def l
  end

  def r
    p [x+1, y+1]
  end

  # utility method:
  def loc; [self.x, self.y] end

  def move(new_x, new_y)
    $board[@x][@y] = "   "
    $board[new_x][new_y] = colorize(" #{@name} ")
    @x = new_x
    @y = new_y
  end

  private def colorize(str)
    # if @color == @color0
    if @color == "blue"
      str.black.bg_light_blue
    elsif @color == "pink"
      str.black.bg_pink
    end
  end

  def crown
  end

end # class Piece

class King < Piece
  # inherited:
    # attr_accessor *___
    # def initialize
    # :l :r
  def ul
  end

  def ur
  end

  def dl
  end

  def dr
  end

end # class King

# board_arr contains 8 row arrays
# each row array contains 4 positions + 4 blanks

$board = Array.new(8) {Array.new(8)}
$board.each_with_index do |row, index|
  n = index%2 == 0 ? 1 : 0
  row.map!.with_index do |sq, index|
    index%2==n ? "░░░" : "   "
  end
end

c = Piece.new("c", "pink", 1, 1)
p c.loc #
c.move(2,2)

p [c.x, c.y] #
c.r

p c.loc


r = []
r[0] = (" a ".." h ").to_a
r[1] = (" i ".." p ").to_a.each { |p| p = p.gray }
r[2] = r[0].map { |p| p = p.light_blue }
r[3] = r[1].map { |p| p = p.black.bg_red }
r[4] = r[0].map { |p| p = p.yellow }
r[5] = r[1].map { |p| p = p.pink }
r[6] = r[0].map { |p| p = p.black.bg_light_blue }
r[7] = r[1].map { |p| p = p.black.bg_pink }


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

render($board)

a = " a ".black.bg_light_blue
b = " b ".black.bg_light_blue
m = " m ".black.bg_pink
N = "<N>".black.bg_pink   # King?
M = "ᵕMᵕ".black.bg_pink
# N = " N ".black.bg_pink.bold.underline   # King?

puts
puts "╔═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╗"
puts "║#{a}║░░░║   ║░░░║#{b}║░░░║#{N}║░░░║"
puts "╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣"
puts "║░░░║   ║░░░║#{m}║░░░║#{M}║░░░║   ║"
puts "╠═══╬═══╬═══╬═══╬═══╬═══╬═══╬═══╣"


# movement:
  # + 1 row, +/-1 column (use negative values for opposite team?)
  # IF (x+1,y+1) is occupied & (x+2,y+2) is open
  # OR (x-1,y+1) is occupied & (x-2,y+2) is open
    #--> THEN allow move to second space, check for more jumps
  # ELSIF (x+1,y+1) or (x-1,y+1) are open
    #--> THEN Allow single move
  # ELSIF (x+1,y+1) OR (x-1,y+1) are open & y == 0 or 8
    #--> THEN Allow move & king the piece

    #=>
  # if x or y >8 or < 0 --> invalid move
    # 

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
#   0-| 0,0 | 0,1 | 0,2 | 0,3 | 0,4 | 0,5 | 0,6 | 0,7 |
#      -----------------------------------------------
#   1-| 1,0 | 1,1 | 1,2 | 1,3 | 1,4 | 1,5 | 1,6 | 1,7 |
#      -----------------------------------------------
#   2-| 2,0 | 2,1 | 2,2 | 2,3 | 2,4 | 2,5 | 2,6 | 2,7 |
#      -----------------------------------------------
#   3-| 3,0 | 3,1 | 3,2 | 3,3 | 3,4 | 3,5 | 3,6 | 3,7 |
#      -----------------------------------------------
#   4-| 4,0 | 4,1 | 4,2 | 4,3 | 4,4 | 4,5 | 4,6 | 4,7 |
#      -----------------------------------------------
#   5-| 5,0 | 5,1 | 5,2 | 5,3 | 5,4 | 5,5 | 5,6 | 5,7 |
#      -----------------------------------------------
#   6-| 6,0 | 6,1 | 6,2 | 6,3 | 6,4 | 6,5 | 6,6 | 6,7 |
#      -----------------------------------------------
#   7-| 7,0 | 7,1 | 7,2 | 7,3 | 7,4 | 7,5 | 7,6 | 7,7 |
#      -----------------------------------------------