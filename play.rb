# Ball = Struct.new(:shape, :color)

class Ball
  
  # attr_accessor :color, :material
  # attr_reader :throwable

  def self.is_throwable?
    @is_throwable
  end

  def material
    @material
  end
  # billiard_ball.material

  def material=(value)
    @material = value
  end
  # billiard_ball.material = "plastic"

  def color
    @color
  end

  def color=(value)
    @color = value
  end

  def is_throwable?
    @is_throwable
  end
 
  def initialize(color, material)
    @color = color
    @material = material
    @is_throwable = true
  end
end

basketball = Ball.new("orange", "rubber")

puts basketball.class
puts basketball.is_throwable?
pp basketball.class.is_throwable?

puts Ball.is_throwable?

class GiantBall < Ball
  @is_throwable = false
end

puts Ball.is_throwable?
puts "GiantBall.is_throwable? = #{GiantBall.is_throwable?}\n\n"
puts GiantBall.is_throwable?

leviathan_ball = GiantBall.new("black","stone")

