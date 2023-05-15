require "gosu"

class Test < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Test Application"
    @circle = Gosu::Image.new("/Users/nom/Actualize/gosu/circle.png")
    @red_circle = Gosu::Image.new("/Users/nom/Actualize/gosu/red_circle.png")
    @circle_radius = (@circle.width / 2)
    @red_circle_radius = (@red_circle.width / 2)
    @circle_scale = 0.05
  end

  def draw
    if button_down?(Gosu::MS_LEFT)
      @red_circle.draw(
        mouse_x - @red_circle_radius * @circle_scale,
        mouse_y - @red_circle_radius * @circle_scale,
        0,
        @circle_scale,
        @circle_scale
      )
    else
      @circle.draw(
        mouse_x - @circle_radius * @circle_scale,
        mouse_y - @circle_radius * @circle_scale,
        0,
        @circle_scale,
        @circle_scale
      )
    end

    if button_down?(Gosu::KB_ESCAPE)
      close
    end
  end
end
