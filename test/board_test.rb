require_relative "./test_helper"

class BoardTest < MiniTest::Test
  def setup
    @board = ToyRobot::Board.new(5, 5)
  end

  def test_zero_zero_position_is_valid
    assert @board.valid?(0, 0)
  end

  def test_upper_right_position_is_valid
    assert @board.valid?(5, 5)
  end

  def test_negative_x_value_is_invalid
    refute @board.valid?(-1, 5)
  end

  def test_negative_y_value_is_invalid
    refute @board.valid?(5, -1)
  end

  def test_negative_x_and_y_values_are_invalid
    refute @board.valid?(-1, -1)
  end

  def test_x_value_bigger_than_board_size_is_invalid
    refute @board.valid?(6, 5)
  end

  def test_y_value_bigger_than_board_size_is_invalid
    refute @board.valid?(5, 6)
  end

  def test_x_and_y_values_bigger_than_board_size_are_invalid
    refute @board.valid?(6, 6)
  end
end
