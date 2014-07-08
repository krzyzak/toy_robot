module ToyRobot
  class Position
    attr_reader :x, :y, :direction

    def initialize(x: nil, y: nil, direction: nil)
      @x = x
      @y = y
      @direction = direction
    end

    def +(other)
      to_x, to_y = case other.direction
      when :north
        [x, y+1]
      when :west
        [x-1, y]
      when :south
        [x, y-1]
      when :east
        [x+1, y]
      end

      Position.new(x: to_x, y: to_y, direction: other.direction)
    end

    def ==(other)
      x == other.x && y == other.y
    end
  end
end
