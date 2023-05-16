class Switch < Gosu::Font
  def initialize
    @switch1 = Gosu::Font.new(32)
  end

  def draw
    @switch1.draw_text("Options", 10, 10, 1, 1, 1, Gosu::Color::BLACK)
  end
end
