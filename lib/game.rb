#Require gems and necessary files
require "gosu"
require_relative "../views/options.rb"
require_relative "../views/cursor.rb"

class Game < Gosu::Window
  def initialize
    super 1920, 1080, false
    self.caption = "Test Application"
    @background = Gosu::Color.argb(0xff2c3e50)

    @switch1 = Switch1.new
    @switch2 = Switch2.new
    @switch = Gosu::Image.new("resources/untoggled-switch.jpeg")

    @circle = Gosu::Image.new("resources/circle.png")
    @red_circle = Gosu::Image.new("resources/red_circle.png")
    @cursor = Cursor.new(self)

    @circle_radius = (@circle.width / 2)
    @red_circle_radius = (@red_circle.width / 2)
    @circle_scale = 0.03
    @switch_scale = 0.1
  end

  def needs_cursor?
    false
  end

  def draw
    draw_quad(0, 0, @background, width, 0, @background, width, height, @background, 0, height, @background)

    @switch1.draw
    @switch2.draw

    @cursor.draw(mouse_x, mouse_y, button_down?(Gosu::MS_LEFT))
    if button_down?(Gosu::KB_ESCAPE)
      close
    end
  end

  def update
    p mouse_y
    if mouse_x < 260 && mouse_y < 180
      p "hello"
    end
  end
end
