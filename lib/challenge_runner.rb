require_relative '../lib/input_parser'
require_relative '../lib/output_printer'

class ChallengeRunner
  def initialize(file_name)
    @file_name = file_name
  end

  def run
    products = InputParser.new(@file_name).parse

    OutputPrinter.new(products).print_output
  end
end
