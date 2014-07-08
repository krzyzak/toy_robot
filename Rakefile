require "bundler/setup"
Bundler.require
require "pathname"
path = Pathname.new(__FILE__).realpath
$:.unshift File.expand_path("../lib", path)
require "toy_robot"

task :console do
  require "irb"
  require "irb/completion"

  ARGV.clear
  IRB.start
end

task :test do
  Bundler.require(:test)

  require "minitest/autorun"
  $:.unshift File.expand_path("../", path)

  Dir["test/*_test.rb"].each{|f| require f }
end


task :game do
  ToyRobot::CLI.new.run!
end
