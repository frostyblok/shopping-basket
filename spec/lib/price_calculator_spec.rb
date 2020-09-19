require_relative '../../lib/price_calculator'

describe PriceCalculator do
  let(:subject) {described_class.new products }
  let(:products) do
    [
      [1, "imported bottle of perfume", 27.99, "import_duty_without_exemption"],
      [1, "bottle of perfume", 18.99, "basic_sales"],
      [1, "packet of headache pills", 9.75, "no_tax"],
      [3, "box of imported chocolates", 11.25, "import_duty_with_exemption"]
    ]
  end
  let(:updated_products_prices) do
    {
      "0" => 32.19,
      "1" => 20.89,
      "2" => 9.75,
      "3" => 35.55
    }
  end

  context "#product_prices_after_calculations!" do
    it "prints output" do
      updated_products = subject.product_prices_after_calculations!

      updated_products.each_with_index do |product, index|
        expect(product[4].to_f).to eq(updated_products_prices[index.to_s])
      end
    end
  end

  context "#total_prices_after_taxes" do
    it "calculates the total prices after taxes for all products" do
      # Not sure if I could do this in a test file but the idea is not to manually set the
      # total price (after tax) of a product.
      # I would love to know what you think.

      # total_price_after_taxes = updated_products_prices.reduce(0) { |sum, (_, value)| sum + value }

      total_price_after_taxes = 98.38
      expect(subject.total_price_after_taxes).to eq(total_price_after_taxes)
    end
  end

  context "#total_taxes" do
    it "calculates the total taxes for all the products" do
      total_taxes = 7.90

      expect(subject.total_taxes.ceil(2)).to eq(total_taxes)
    end
  end
end
