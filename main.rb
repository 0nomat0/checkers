
# black, red, green, yellow, blue, pink, light_blue, gray, bg_red, bg_light_blue, bg_pink

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
  
  def initialize (color, x, y)
  @color = color
  @x = x
  @y = y
  end

  def self.l
  end

  def self.r
  end

  private

  def self.kingme
  end

end # class Piece

class King < Piece
  attr_accessor :color, :x, :y

  def initialize (color, x, y)
  @color = color
  @x = x
  @y = y
  end
  
  def self.ul
  end

  def self.ur
  end

  def self.dl
  end

  def self.dr
  end

end # class King

redking = King.new("red", 0, 3)
p redking

# hash_red
# hash_white
# pos[piece] = loc

# board_arr contains 8 row arrays
# each row array contains 8 positions / pieces

row_init1 = (" a ".." h ").to_a
row_init2 = (" i ".." p ").to_a

r1 = row_init1
r2 = row_init2.each { |p| p = p.gray }
r3 = r1.map { |p| p = p.light_blue }
r4 = r2.map { |p| p = p.red }
r5 = r1.map { |p| p = p.yellow }
r6 = r2.map { |p| p = p.pink }
r7 = r1.map { |p| p = p.black.bg_light_blue }
r8 = r2.map { |p| p = p.black.bg_pink }

@board_arr = [r1, r2, r3, r4, r5, r6, r7, r8]

print "row_init1 is an ", row_init1.class, " - ", row_init1.object_id, "\n" 
print "row_init2 is an ", row_init2.class, " - ", row_init2.object_id, "\n" 
print "r1 is an ", r1.class, " - ", r1.object_id, "\n"
print "r2 is an ", r2.class, " - ", r2.object_id, "\n"
print "r3 is an ", r3.class, " - ", r3.object_id, "\n\n"

print row_init1, "\n"
print r1, "\n\n"

# rendering:

def render
  board_arr = @board_arr

  top = "╔" + "═══╦"*7 + "═══╗" 
  mid = "╠" + "═══╬"*7 + "═══╣"
  bot = "╚" + "═══╩"*7 + "═══╝"
  side = "║"
  
  print top, "\n"
  board_arr[0..6].each do |row| # loop for each of 7 row hashes
    print side                  #=> "║"
    row.each do |state|             # loop for each of 8 elements
      print state + side
    end 
    print "\n", mid, "\n"
  end
  print side
  board_arr[7].each do |state|  # final row array treated separately
      print state + side
    end 
  print "\n", bot, "\n"
end

render

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
