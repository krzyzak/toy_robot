class RobotTest < MiniTest::Test
  def setup
    @robot = ToyRobot::Robot.new(position: ToyRobot::Position.new(x: 0, y: 0), direction: :north, board: ToyRobot::Board.new(5, 5))
  end

  def test_board_is_required
    assert_raises ArgumentError do
      ToyRobot::Robot.new
    end
  end
  # move!

  def test_valid_move_should_change_robot_position
    expected_position = @robot.position + ToyRobot::Position.new(direction: :north)

    @robot.move!

    assert_equal @robot.position, expected_position
  end

  def test_invalid_move_should_not_change_robots_position
    current_position = @robot.position
    @robot.direction = :west

    @robot.move!

    assert_equal @robot.position, current_position
  end

  # left!

  def test_turning_left_from_north_position_should_set_west_direction
    @robot.direction = :north
    @robot.left!

    assert_equal :west, @robot.direction
  end

  def test_turning_left_from_west_position_should_set_south_direction
    @robot.direction = :west
    @robot.left!

    assert_equal :south, @robot.direction
  end

  def test_turning_left_from_south_position_should_set_east_direction
    @robot.direction = :south
    @robot.left!

    assert_equal :east, @robot.direction
  end

  def test_turning_left_from_east_position_should_set_noth_direction
    @robot.direction = :east
    @robot.left!

    assert_equal :north, @robot.direction
  end

  # right!

  def test_turning_right_from_north_position_should_set_east_direction
    @robot.direction = :north
    @robot.right!

    assert_equal :east, @robot.direction
  end

  def test_turning_right_from_east_position_should_set_south_direction
    @robot.direction = :east
    @robot.right!

    assert_equal :south, @robot.direction
  end

  def test_turning_right_from_south_position_should_set_west_direction
    @robot.direction = :south
    @robot.right!

    assert_equal :west, @robot.direction
  end

  def test_turning_right_from_west_position_should_set_noth_direction
    @robot.direction = :west
    @robot.right!

    assert_equal :north, @robot.direction
  end
end
