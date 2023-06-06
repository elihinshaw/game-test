class Switch1 < Gosu::Image
  def initialize
    @switch1 = Gosu::Image.new("resources/switch1.jpg")
    @scale = 1
    @switch_x = 0
    @switch_y = 0
  end

  def draw
    @switch1.draw(@switch_x, @switch_y, 0, @scale, @scale)
  end
end

class Switch2 < Gosu::Image
  def initialize
    @switch1 = Gosu::Image.new("resources/switch2.jpg")
    @scale = 0.5
    @switch_x = 0
    @switch_y = 0
  end

  def draw
    @switch1.draw(@switch_x, @switch_y, 1, @scale, @scale)
  end
end
