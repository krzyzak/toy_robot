require "forwardable"

module ToyRobot
  class CLI
    extend Forwardable

    def_delegators :game, :place, :report, :move, :left, :right

    def run!
      begin
        loop do
          "> ".display
          input = STDIN.gets.chomp
          run_command!(input.downcase)
        end
      rescue Interrupt
        puts "\n Bye!"
        exit
      end
    end

    private
    def run_command!(command)
      if command =~ place_regexp
        _, x, y, direction = command.match(place_regexp).to_a
        place(x, y, direction)
      elsif command == "move"
        move
      elsif command == "left"
        left
      elsif command == "right"
        right
      elsif command == "report"
        puts report if report
      elsif command == "exit"
        raise Interrupt
      else
        puts "Invalid command: #{command}"
      end
    end

    def game
      @game ||= Game.new
    end

    def place_regexp
      /place (-?\d+),\s?(-?\d+),\s?(\w+)/
    end
  end
end
