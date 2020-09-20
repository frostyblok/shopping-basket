require_relative '../helpers/input_parser_helper'

class InputParser
  include InputParserHelper

  attr_reader :file_name

  def initialize(file_name)
    @file_name = file_name
  end

  def parse
    products = []

    File.foreach("lib/assets/#{file_name}.txt").each do |line|
      line = line.split(' ')

      product_quantity = line.first.to_i
      product_name = "#{line[1...line.index('at')].join(' ')}"
      product_price = line.last.to_f

      products << [product_quantity, product_name, product_price, taxable(product_name)]
    end
    products

  rescue Errno::ENOENT => e
    puts "ERROR: #{e.message}"
    exit -1
  end
end
