require_relative '../helpers/price_calculator_helper'

class PriceCalculator
  include PriceCalculatorHelper

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
end
