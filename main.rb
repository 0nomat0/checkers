
class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def black
    colorize(30)
  end  

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize(34)
  end

  def pink
    colorize(35)
  end

  def light_blue
    colorize(36)
  end

  def gray
    colorize(37)
  end

  def bg_red
    colorize(41)
  end
end

# p = "(A)"

# puts p
# puts p.red
# puts p.black
# puts p.green
# puts p.gray
# puts p.bg_red.black

# def p_assign(p=" ")

# a = "a"
# # p = a
# p = " "
# n = 8

# puts "----"*n
# n.times do
#   print  "| #{p} "*n
#   puts "|"
#   print "----"*n
#   print "\n"
# end

# hash_red
# hash_white
# pos[piece] = loc

# board_arr contains 8 column hashes:
  # 1. hash[position] = piece
  # 2. hash[piece] = position

row_arr = ("(A)".."(H)").to_a

r1 = row_arr
r2 = r1.map { |e| e = e.gray }
r3 = r1.map { |e| e = e.light_blue }
r4 = r1.map { |e| e = e.green }
r5 = r1.map { |e| e = e.yellow }
r6 = r1.map { |e| e = e.pink }
r7 = r1.map { |e| e = e.red }
r8 = r1.map { |e| e = e.bg_red }

@board_arr = [r1, r2, r3, r4, r5, r6, r7, r8]

print "row_arr is an ", row_arr.class, " - ", row_arr.object_id, "\n" 
print "r1 is an ", r1.class, " - ", r1.object_id, "\n"
print "r2 is an ", r2.class, " - ", r2.object_id, "\n\n"

@board_arr[0][3] = @board_arr[0][3].pink

print row_arr, "\n"
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
    row.each do |stat|             # loop for each of 8 elements
      print stat + side
    end 
    print "\n", mid, "\n"
  end
  print side
  board_arr[7].each do |stat|  # final row array treated separately
      print stat + side
    end 
  print "\n", bot, "\n"
end

render

# def render2
#   s = @space
#   print "╔═══", "╦═══"*7, "╗", "\n"
#   7.times do
#     print "║#{s}"*8, "║ \n",
#     "╠═══", "╬═══"*7, "╣", "\n"
#   end
#   print"║#{s}"*8, "║ \n",
#   "╚═══", "╩═══"*7, "╝", "\n"
# end

# move piece: +/-1 row, +/-1 column

# top1, top2, top3 = "╔═══" , "╦═══" , "╗" 
# spa1, spa2, spa3 = "║#{s}", "║#{s}", "║"
# mid1, mid2, mid3 = "╠═══" , "╬═══" , "╣"
# bot1, bot2, bot3 = "╚═══" , "╩═══" , "╝"

# ╔═══╦═══╗
# ║(A)║(b)║
# ╠═══╬═══╣
# ║ c ║ d ║
# ╚═══╩═══╝
