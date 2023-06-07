require "gosu"

require_relative "../views/cursor.rb"

class EndScreen < Gosu::Window
  def initialize
    super(960, 540, false)
    self.caption = "GAMEOVER"
    @background = Gosu::Color.argb(0xff2c3e50)
    @font = Gosu::Font.new(self, Gosu::default_font_name, 50)
    @font2 = Gosu::Font.new(self, Gosu::default_font_name, 40)

    # Creates and initializes cursor's variables from Cursor class in cursor.rb
    @circle = Gosu::Image.new("resources/circle.png")
    @black_circle = Gosu::Image.new("resources/black_circle.png")
    @cursor = Cursor.new(self)
  end

  # Disables mouse cursor
  def needs_cursor?
    false
  end

  # Draws menu text
  def draw
    draw_quad(0, 0, @background, width, 0, @background, width, height, @background, 0, height, @background)
    @font.draw_text("GAME OVER", 345, 50, 0, 1, 1, Gosu::Color::RED)
    @font.draw_text("Space: Restart", 340, 300, 0, 1, 1, Gosu::Color::WHITE)
    @font.draw_text("ESC: Exit", 405, 375, 0, 0.75, 0.75, Gosu::Color::RED)

    @font2.draw_text("FINAL SCORE: #{$score}", 315, 125, 0, 1, 1, Gosu::Color::GREEN)

    # Draws cursor to mouse position
    @cursor.draw(mouse_x, mouse_y, button_down?(Gosu::MS_LEFT))
  end

  # Checks input for space or esc to start or exit
  def button_down(id)
    case id
    when Gosu::KB_SPACE
      close
      $score = 0
      Game.new.show
    when Gosu::KB_ESCAPE
      close
    end
  end
end
