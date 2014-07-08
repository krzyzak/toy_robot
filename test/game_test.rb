class GameTest < MiniTest::Test
  def setup
    @game = ToyRobot::Game.new
  end

  def test_move_should_move_robot_if_has_been_placed
    ToyRobot::Robot.any_instance.stubs(:placed?).returns(true)
    ToyRobot::Robot.any_instance.expects(:move!)

    @game.move
  end

  def test_left_should_move_robot_left_if_has_been_placed
    ToyRobot::Robot.any_instance.stubs(:placed?).returns(true)
    ToyRobot::Robot.any_instance.expects(:left!)

    @game.left
  end

  def test_right_should_move_robot_right_if_has_been_placed
    ToyRobot::Robot.any_instance.stubs(:placed?).returns(true)
    ToyRobot::Robot.any_instance.expects(:right!)

    @game.right
  end

  def test_report_should_be_executed_if_robot_has_been_placed
    ToyRobot::Robot.any_instance.stubs(:placed?).returns(true)
    ToyRobot::Robot.any_instance.expects(:report)

    @game.report
  end

  # not placed
  def test_move_should_be_discarded_if_robot_is_not_placed
    ToyRobot::Robot.any_instance.stubs(:placed?).returns(false)
    ToyRobot::Robot.any_instance.expects(:move!).never

    @game.move
  end

  def test_left_should_be_discarded_if_robot_is_not_placed
    ToyRobot::Robot.any_instance.stubs(:placed?).returns(false)
    ToyRobot::Robot.any_instance.expects(:left!).never

    @game.left
  end

  def test_right_should_be_discarded_if_robot_is_not_placed
    ToyRobot::Robot.any_instance.stubs(:placed?).returns(false)
    ToyRobot::Robot.any_instance.expects(:right!).never

    @game.right
  end

  def test_report_should_be_discarded_if_robot_is_not_placed
    ToyRobot::Robot.any_instance.stubs(:placed?).returns(false)
    ToyRobot::Robot.any_instance.expects(:report).never

    @game.report
  end
end
