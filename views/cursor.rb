# Creates Cursor class that initalizes and draws the cursors (red and white)
# This will later be updated to the mouse position constantly
class Cursor
  def initialize(window)
    @circle = Gosu::Image.new("resources/circle.png")
    @black_circle = Gosu::Image.new("resources/black_circle.png")
    @black_circle_radius = (@black_circle.width / 2)
    @circle_scale = 0.02
    @window = window
  end

  def draw(x, y, left_button_down)
    @circle.draw(
      x - @black_circle_radius * @circle_scale,
      y - @black_circle_radius * @circle_scale,
      5,
      @circle_scale,
      @circle_scale
    )
    if left_button_down
      @black_circle.draw(
        x - @black_circle_radius * @circle_scale,
        y - @black_circle_radius * @circle_scale,
        5,
        @circle_scale,
        @circle_scale
      )
    end
  end
end
