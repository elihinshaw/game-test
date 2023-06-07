# # Creates first switch via initialization and the draw method
# class SwitchOn < Gosu::Image
#   def initialize
#     @switch_on = Gosu::Image.new("resources/switch-on.jpg")

#     $scale = 0.1

#     $switch_x
#     $switch_y

#     @clicked = false
#   end

#   def draw
#     @switch_on.draw($switch_x, $switch_y, 0, $scale, $scale)
#   end
# end

# Creates second switch via initialization and the draw method
class Square < Gosu::Image
  def initialize
    @square = Gosu::Image.new("resources/switch-off.jpg")

    $scale = 0.1

    $switch_x
    $switch_y
  end

  def draw
    @square.draw($switch_x, $switch_y, 1, $scale, $scale)
  end
end
