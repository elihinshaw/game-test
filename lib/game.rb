require "gosu"
require_relative "../views/options.rb"
require_relative "cursor.rb"

class Game < Gosu::Window
  def initialize
    super 1920, 1080, true
    self.caption = "Test Application"
    @background = Gosu::Color.argb(0xff2c3e50)
    @switch1 = Switch.new
    @circle = Gosu::Image.new("resources/circle.png")
    @red_circle = Gosu::Image.new("resources/red_circle.png")
    @switch = Gosu::Image.new("resources/untoggled-switch.jpeg")
    @circle_radius = (@circle.width / 2)
    @red_circle_radius = (@red_circle.width / 2)
    @circle_scale = 0.03
    @cursor = Cursor.new(self)
  end

  def needs_cursor?
    false
  end

  def draw
    draw_quad(0, 0, @background, width, 0, @background, width, height, @background, 0, height, @background)

    @switch1.draw

    @cursor.draw(mouse_x, mouse_y, button_down?(Gosu::MS_LEFT))

    if button_down?(Gosu::KB_ESCAPE)
      close
    end
  end
end
