
# def p_assign(p=" ")

a = "a"
# p = a
p = " "
n = 8

puts "----"*n
n.times do
  print  "| #{p} "*n
  puts "|"
  print "----"*n
  print "\n"
end

# hash_red
# hash_white
# pos[piece] = loc

# row1 = Hash.new
# row2 = Hash.new
# row3 = Hash.new
# row4 = Hash.new
# row5 = Hash.new
# row6 = Hash.new
# row7 = Hash.new
# row8 = Hash.new

# board_arr = .to_a
# p board_arr.count

# move piece: +/-1 row, +/-1 column


# ╔═══╦═══╗
# ║(A)║(b)║
# ╠═══╬═══╣
# ║ c ║ d ║
# ╚═══╩═══╝
#
# 

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

p = "(A)"

puts p
puts p.red
puts p.black
puts p.green
puts p.gray
puts p.bg_red.black