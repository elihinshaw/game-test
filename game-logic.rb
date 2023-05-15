require "gosu"

class Game < Gosu::Window
  def initialize
    super 1920, 1080, true
    self.caption = "Test Application"
    @background = Gosu::Color.argb(0xff_00ff00)
    @circle = Gosu::Image.new("/Users/nom/Actualize/gosu/circle.png")
    @red_circle = Gosu::Image.new("/Users/nom/Actualize/gosu/red_circle.png")
    @switch = Gosu::Image.new("/Users/nom/Actualize/gosu/untoggled-switch.jpeg")
    @circle_radius = (@circle.width / 2)
    @red_circle_radius = (@red_circle.width / 2)
    @circle_scale = 0.03
  end

  def needs_cursor?
    false
  end

  def draw
    draw_quad(0, 0, @background, width, 0, @background, width, height, @background, 0, height, @background)
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
