module ToyRobot
  class Board
    attr_reader :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def valid?(to_x, to_y)
      (0..x).cover?(to_x) && (0..y).cover?(to_y)
    end
  end
end
