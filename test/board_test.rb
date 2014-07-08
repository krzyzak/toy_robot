class BoardTest < MiniTest::Test
  def setup
    @board = ToyRobot::Board.new(5, 5)
  end

  def test_zero_zero_position_is_valid
    assert @board.valid?(ToyRobot::Position.new(x: 0, y: 0))
  end

  def test_upper_right_position_is_valid
    assert @board.valid?(ToyRobot::Position.new(x: 5, y: 5))
  end

  def test_negative_x_value_is_invalid
    refute @board.valid?(ToyRobot::Position.new(x: -1, y: 5))
  end

  def test_negative_y_value_is_invalid
    refute @board.valid?(ToyRobot::Position.new(x: 5, y: -1))
  end

  def test_negative_x_and_y_values_are_invalid
    refute @board.valid?(ToyRobot::Position.new(x: -1, y: -1))
  end

  def test_x_value_bigger_than_board_size_is_invalid
    refute @board.valid?(ToyRobot::Position.new(x: 6, y: 5))
  end

  def test_y_value_bigger_than_board_size_is_invalid
    refute @board.valid?(ToyRobot::Position.new(x: 5, y: 6))
  end

  def test_x_and_y_values_bigger_than_board_size_are_invalid
    refute @board.valid?(ToyRobot::Position.new(x: 6, y: 6))
  end
end
