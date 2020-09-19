class PriceCalculator
  PRODUCT_QUANTITY = 0
  PRODUCT_NAME = 1
  PRODUCT_PRICE = 2
  TAX_DETAILS = 3
  PRODUCT_PRICE_WITH_TAX = 4
  PRODUCT_TAX = {
    "basic_sales" => 0.1,
    "import_duty_with_exemption" => 0.05,
    "import_duty_without_exemption" => 0.15,
    "no_tax" => 0.0
  }

  def initialize(products)
    @products = products
  end

  def product_prices_after_calculations!
    @products.map do |product|
      product << "%.2f" % ((calculated_tax(product)/product[PRODUCT_QUANTITY] + product[PRODUCT_PRICE]) * product[PRODUCT_QUANTITY])
      product
    end
  end

  def total_price_after_taxes
    total_price + total_taxes
  end

  def total_taxes
    @products.reduce(0) do |tax, product|
      tax += calculated_tax(product)
      tax
    end
  end

  private

  def total_price
    @products.reduce(0) do |price, product|
      price += (product[PRODUCT_PRICE] * product[PRODUCT_QUANTITY])
      price
    end
  end

  def calculated_tax(product)
    # Rounding up by 0.05 was somewhat a challenge, I luckily was able to reference this: https://www.ruby-forum.com/t/rounding-up-by-0-05/194760
    ((PRODUCT_TAX[product[TAX_DETAILS]] * product[PRODUCT_PRICE]) * 20).ceil/20.0 * product[PRODUCT_QUANTITY]
  end
end
