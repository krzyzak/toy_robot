module ToyRobot
  class Board
    attr_reader :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def valid?(position)
      (0..x).cover?(position.x) && (0..y).cover?(position.y)
    end
  end
end
