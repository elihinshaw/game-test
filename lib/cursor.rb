class Cursor
  def initialize(window)
    @circle = Gosu::Image.new("resources/circle.png")
    @red_circle = Gosu::Image.new("resources/red_circle.png")
    @red_circle_radius = (@red_circle.width / 2)
    @circle_scale = 0.03
    @window = window
  end

  def draw(x, y, left_button_down)
    if left_button_down
      @red_circle.draw(
        x - @red_circle_radius * @circle_scale,
        y - @red_circle_radius * @circle_scale,
        0,
        @circle_scale,
        @circle_scale
      )
    else
      @circle.draw(
        x - @red_circle_radius * @circle_scale,
        y - @red_circle_radius * @circle_scale,
        0,
        @circle_scale,
        @circle_scale
      )
    end
  end
end
