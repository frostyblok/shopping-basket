class InputParser
  attr_reader :file_name

  EXEMPTED_PRODUCTS = %w(book chocolate pills)
  PRODUCT_ARRAY_WITH_ONE_WORD_NAME_SIZE = 4

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

  private

  def one_word_product?(line)
    line.size == PRODUCT_ARRAY_WITH_ONE_WORD_NAME_SIZE
  end

  def is_exempted_product?(product_name)
    EXEMPTED_PRODUCTS.one? { |good| product_name.include? good }
  end

  def is_imported_product?(product_name)
    product_name.include? 'imported'
  end

  def taxable(product_name)
    if is_imported_product?(product_name) && !is_exempted_product?(product_name)
      'import_duty_without_exemption'
    elsif is_imported_product?(product_name)
      'import_duty_with_exemption'
    elsif is_exempted_product? product_name
      'no_tax'
    else
      'basic_sales'
    end
  end
end
