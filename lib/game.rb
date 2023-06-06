# Adds required gems and necessary files
require "gosu"
require_relative "../views/options.rb"
require_relative "../views/cursor.rb"

class Game < Gosu::Window
  def initialize
    # Creates canvas and size
    super 960, 540, false

    # Adds test application as application's caption
    self.caption = "Test Application"

    # Sets background color
    @background = Gosu::Color.argb(0xff2c3e50)

    # Creates and initalizes new switches from Switch classes in switch.rb
    @switch1 = Switch1.new
    @switch2 = Switch2.new
    @switch = Gosu::Image.new("resources/untoggled-switch.jpeg")

    # Creates and initializes cursor's variables from Cursor class in cursor.rb
    @circle = Gosu::Image.new("resources/circle.png")
    @red_circle = Gosu::Image.new("resources/red_circle.png")
    @cursor = Cursor.new(self)
  end

  # Disables mouse cursor
  def needs_cursor?
    false
  end

  def draw
    # Draw background
    draw_quad(0, 0, @background, width, 0, @background, width, height, @background, 0, height, @background)

    # Draws the buttons on the canvas
    @switch1.draw
    @switch2.draw

    # Draws cursor to mouse position
    @cursor.draw(mouse_x, mouse_y, button_down?(Gosu::MS_LEFT))
    if button_down?(Gosu::KB_ESCAPE)
      close
    end
  end

  def update
    # Checks if box gets clicked
    if mouse_x < 260 && mouse_y < 180 && button_down?(Gosu::MS_LEFT)
      p "you clicked the box!"
    end
  end
end
