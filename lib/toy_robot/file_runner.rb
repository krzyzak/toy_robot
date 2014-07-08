module ToyRobot
  class FileRunner
    class ExpectationFailed < StandardError
      attr_reader :expected, :current

      def initialize(expected, current)
        @expected = expected
        @current = current
      end

      def message
        "Expactation failed. \n #{expected} expected,\n got #{current}"
      end
    end

    attr_reader :files

    def initialize(paths)
      @files = paths.map{|path| File.read(path) }
    end

    def run!
      files.each{|file| run_file(file) }

      puts "All tests passed!" if test_mode?
    end


    private
    def test_mode?
      !!@test_mode
    end

    def run_file(file)
      @test_mode = file.downcase =~ /output/
      file.each_line do |line|
        line = line.downcase.strip
        if line[0, 6] == "output"
          check_line(line)
        else
          cli.run_command!(line) unless test_mode? && line == "report"
        end
      end
    end

    def check_line(line)
      current = line_to_values(cli.report.downcase)
      expected = line_to_values(line.split(":").last)

      raise ExpectationFailed.new(expected, current) unless expected == current
    end

    def line_to_values(line)
      line.split(",").map(&:strip)
    end

    def cli
      @cli ||= CLI.new
    end
  end
end
