module ToyRobot
  class Robot
    attr_reader :position, :board, :direction

    DIRECTIONS = [:north, :west, :south, :east]

    def initialize(position: nil, direction: nil, board: nil)
      @position = position
      @direction = direction
      @board = board || (raise ArgumentError.new("Board is required"))
    end

    def move!
      self.position= new_position if placed?
    end

    def left!
      @direction = DIRECTIONS[direction_index+1] || DIRECTIONS[0]
    end

    def right!
      @direction = DIRECTIONS[direction_index-1]
    end

    def position=(new_position)
      @position = new_position if board.valid?(new_position)
    end

    def direction=(new_direction)
      @direction = new_direction if DIRECTIONS.include?(new_direction)
    end

    def placed?
      position && direction
    end

    def report
      [position.x, position.y, direction.upcase].join(", ")
    end

    private
    def new_position
      position + Position.new(direction: direction)
    end

    def direction_index
      DIRECTIONS.index(@direction)
    end
  end
end
