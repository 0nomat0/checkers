module Colorize

  def colorize(str)
    case @color
      when "blue" then str.black.bg_light_blue
      when "pink" then str.black.bg_pink
      when "red" then str.bg_red
      when "gray" then str.red.bg_gray
    end
  end

  def pieceify
    spacer = self.class == King ? "ᵕ" : " "  # if piece is a King, display its crown
    colorize("#{spacer}#{@id}#{spacer}")
  end
  
  def set_color(color_code, effect=0)
    "\e[#{color_code}m#{self}\e[#{effect}m"
  end

  def black
    set_color(30)
  end  

  def red
    set_color(31)
  end

  def green
    set_color(32)
  end

  def yellow
    set_color(33)
  end

  def blue
    set_color(34)
  end

  def pink
    set_color(35)
  end

  def light_blue
    set_color(36)
  end

  def gray
    set_color(37)
  end

  def bg_red
    set_color(41)
  end
  def bg_pink
    set_color(45)
  end

  def bg_light_blue
    set_color(46)
  end

  def bg_gray
    set_color(47)
  end

  def bold
    set_color(1, 22)
  end

  def underline
    set_color(4, 24)
  end  

end # module Colorize
