require_relative '../../lib/price_calculator'
require_relative '../../helpers/price_calculator_helper'

describe PriceCalculatorHelper do
  let(:subject) { PriceCalculator.new(products).extend(described_class) }
  let(:products) do
    [
      [1, "imported bottle of perfume", 27.99, "import_duty_without_exemption"],
      [1, "bottle of perfume", 18.99, "basic_sales"],
      [1, "packet of headache pills", 9.75, "no_tax"],
      [3, "box of imported chocolates", 11.25, "import_duty_with_exemption"]
    ]
  end
  let(:total_price_for_products) { 90.48 }

  context "#total_price" do
    it 'returns total price for all products' do
      expect(subject.total_price.ceil(2)).to eq total_price_for_products
    end
  end

  context "#calculated_tax" do
    it 'returns calculated tax for the first product on the list' do
      tax_for_first_product = 4.2

      expect(subject.calculated_tax(products.first)).to eq tax_for_first_product
    end
  end
end
