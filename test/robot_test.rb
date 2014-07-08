class RobotTest < MiniTest::Test
  def setup
    @robot = ToyRobot::Robot.new(position: ToyRobot::Position.new(x: 0, y: 0), direction: :north, board: ToyRobot::Board.new(5, 5))
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
