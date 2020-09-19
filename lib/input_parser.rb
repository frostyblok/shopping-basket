require_relative '../helpers/input_parser_helper'

class InputParser
  include InputParserHelper

  attr_reader :file_name

  def initialize(file_name)
    @file_name = file_name
  end

  def parse
    products = []
    File.open("lib/assets/#{file_name}.txt").each do |line|
      line = line.split(' ')
      product_quantity = line.first.to_i

      # Get product name for products with one-word names and ones with multi-word names
      product_name = one_word_product?(line) ? "#{line[1]}" : "#{line[1..(line.index('at') - 1)].join(' ')}"
      product_price = line.last.to_f

      products << [product_quantity, product_name, product_price, taxable(product_name)]
    end
    products
  end
end
