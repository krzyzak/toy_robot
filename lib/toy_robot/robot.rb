module ToyRobot
  class Robot
    attr_reader :position, :board
    attr_accessor :direction

    DIRECTIONS = [:north, :west, :south, :east]

    def initialize(position:, direction:, board:)
      @position = position
      @direction = direction
      @board = board
    end

    def left!
      @direction = DIRECTIONS[direction_index+1] || DIRECTIONS[0]
    end

    def right!
      @direction = DIRECTIONS[direction_index-1]
    end

    private
    def direction_index
      DIRECTIONS.index(@direction)
    end
  end
end
