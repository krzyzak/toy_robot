module ToyRobot
  class Board < Struct.new(:x, :y)
    def valid?(position)
      (0..x).cover?(position.x) && (0..y).cover?(position.y)
    end
  end
end
