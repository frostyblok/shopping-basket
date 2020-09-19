require_relative '../../lib/output_printer'

describe OutputPrinter do
  let(:subject) {described_class.new product }
  let(:product) do
    [
      [1, "imported bottle of perfume", 27.99, "import_duty_without_exemption"],
      [1, "bottle of perfume", 18.99, "basic_sales"],
      [1, "packet of headache pills", 9.75, "no_tax"],
      [3, "box of imported chocolates", 11.25, "import_duty_with_exemption"]
    ]
  end

  context "#print_output" do
    it "prints output" do
      expect(subject.print_output).to_not be_nil
      expect(subject.print_output.class).to be(String)
    end
  end
end
