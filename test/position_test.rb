class PositionTest < MiniTest::Test
  def setup
    @position = ToyRobot::Position.new(x: 0, y:0)
  end

  def test_going_north_should_increase_y_value
    new_position = @position + ToyRobot::Position.new(direction: :north)

    assert_equal 0, new_position.x
    assert_equal 1, new_position.y
  end

  def test_going_west_should_decrease_x_value
    new_position = @position + ToyRobot::Position.new(direction: :west)

    assert_equal -1, new_position.x
    assert_equal 0, new_position.y
  end

  def test_going_south_should_decrease_y_value
    new_position = @position + ToyRobot::Position.new(direction: :south)

    assert_equal 0, new_position.x
    assert_equal -1, new_position.y
  end

  def test_going_ease_should_increase_x_value
    new_position = @position + ToyRobot::Position.new(direction: :east)

    assert_equal 1, new_position.x
    assert_equal 0, new_position.y
  end
end
