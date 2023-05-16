class Switch < Gosu::Font
  def initialize
    @switch1 = Gosu::Image.from_text(self, "Text", Gosu.default_font_name, 45)
  end

  def draw
    @switch1.draw(10, 1, 1)
  end
end
