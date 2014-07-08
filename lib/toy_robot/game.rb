module ToyRobot
  class Game
    attr_reader :board

    def initialize
      @board = Board.new(5, 5)
    end

    def place(x, y, direction)
      position = Position.new(x: Integer(x), y: Integer(y))

      robot.tap do |r|
        r.position = position
        r.direction = direction.downcase.to_sym
      end
    end

    def move
      robot.move! if robot.placed?
    end

    def left
      robot.left! if robot.placed?
    end

    def right
      robot.right! if robot.placed?
    end

    def report
      robot.report if robot.placed?
    end

    private
    def robot
      @robot ||= Robot.new(board: board)
    end
  end
end
