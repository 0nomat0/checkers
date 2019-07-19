module Colorize

  class String
    # colorization

    private
    def colorize(color_code, effect=0)
      "\e[#{color_code}m#{self}\e[#{effect}m"
    end

    public
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

    def bg_light_blue
      colorize(46)
    end

    def bg_pink
      colorize(45)
    end

    def bold
      colorize(1, 22)
    end

    def underline
      colorize(4, 24)
    end

  end # class String

  def set_color
    

end # module Colorize