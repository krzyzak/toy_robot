require "minitest/autorun"
require "pathname"

path = Pathname.new(__FILE__).realpath
require File.join(File.expand_path("../../lib", path), "toy_robot.rb")
