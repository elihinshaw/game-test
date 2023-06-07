# Adds required gems and necessary files
require "gosu"

require_relative "../views/square.rb"
require_relative "../views/cursor.rb"
require_relative "end-screen.rb"

$switch_x = 540
$switch_y = 200
$score = 0

class Game < Gosu::Window
  def initialize
    # Creates canvas and size
    super 960, 540, false

    # Adds test application as application's caption
    self.caption = "Clicky Game"

    # Sets background color
    @background = Gosu::Color.argb(0xff2c3e50)

    # Creates and initalizes new switches from Switch classes in switch.rb
    @square = Square.new
    # @switch = Gosu::Image.new("resources/untoggled-switch.jpeg")
    # @switch_on = SwitchOn.new

    # Creates and initializes cursor's variables from Cursor class in cursor.rb
    @circle = Gosu::Image.new("resources/circle.png")
    @black_circle = Gosu::Image.new("resources/black_circle.png")
    @cursor = Cursor.new(self)

    # Adds score text
    @font = Gosu::Font.new(self, Gosu::default_font_name, 35)
    @font2 = Gosu::Font.new(self, Gosu::default_font_name, 20)

    # Adds a timer and text
    @timer = Time.now + 15
    @font3 = Gosu::Font.new(self, Gosu::default_font_name, 35)
  end

  # Disables mouse cursor
  def needs_cursor?
    false
  end

  # # Adds a "clicked" status
  # def button_down(id)
  #   @clicked = true if id == Gosu::MS_LEFT
  # end

  def update
    # Checks if box gets clicked
    case
    when mouse_x <= ($switch_x.to_f + 54) && mouse_y <= ($switch_y.to_f + 36) && mouse_x >= $switch_x && mouse_y >= $switch_y.to_f && button_down?(Gosu::MS_LEFT)
      $switch_x = rand(100..860)
      $switch_y = rand(100..440)
      $score += 100
      # @clicked = false
    end

    # Checks if timer is complete
    if Time.now >= @timer
      EndScreen.new.show
    end
  end

  def draw
    # Draw background
    draw_quad(0, 0, @background, width, 0, @background, width, height, @background, 0, height, @background)

    # Draws the buttons on the canvas
    @square.draw

    # Draws cursor to mouse position
    @cursor.draw(mouse_x, mouse_y, button_down?(Gosu::MS_LEFT))

    # Draws score text
    @font.draw_text("SCORE: #{$score}", 20, 20, 0, 1, 1, Gosu::Color::BLACK)

    # Draws timer on screen
    remaining_time = [@timer - Time.now, 0].max.to_i
    @font3.draw_text("Timer: #{remaining_time}", 800, 20, 0, 1, 1, Gosu::Color::BLACK)
    # Closes application if escape is pressed
    if button_down?(Gosu::KB_ESCAPE)
      close
    end
  end
end
