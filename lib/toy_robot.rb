require "pathname"
path = Pathname.new(__FILE__).realpath
$:.unshift File.expand_path("../../lib", path)

require "toy_robot/board"
require "toy_robot/robot"

module ToyRobot
end
