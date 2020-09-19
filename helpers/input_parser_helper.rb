module InputParserHelper
  EXEMPTED_PRODUCTS = %w(book chocolate pills)
  PRODUCT_ARRAY_WITH_ONE_WORD_NAME_SIZE = 4

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
