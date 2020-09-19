require_relative '../lib/price_calculator'

class OutputPrinter
  def initialize(products)
    @products = products
    @price_calculator = PriceCalculator.new @products
  end

  def print_output
    output = ''

    output += updated_product_details
    output += "Sales Taxes: #{"%.2f" % @price_calculator.total_taxes}\n"
    output += "Total: #{@price_calculator.total_price_after_taxes}"

    # This logs output in the console and also returns the output, making the method easy to test
    puts output
    output
  end

  private

  def updated_product_details
    updated_products = @price_calculator.product_prices_after_calculations!

    updated_products.map do |product|
      # Formats the output as expected from the challenge instructions
      "#{product[PriceCalculator::PRODUCT_QUANTITY]} #{product[PriceCalculator::PRODUCT_NAME]}: #{product[PriceCalculator::PRODUCT_PRICE_WITH_TAX]}\n"
    end.join
  end
end
