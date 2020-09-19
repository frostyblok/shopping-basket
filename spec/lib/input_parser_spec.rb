require_relative '../../lib/input_parser'

describe InputParser do
  let(:input_1_array_content) do
    [
      [2, "book", 12.49, "no_tax"],
      [1, "music CD", 14.99, "basic_sales"],
      [1, "chocolate bar", 0.85, "no_tax"]
    ]
  end
  let(:input_3_array_content) do
    [
      [1, "imported bottle of perfume", 27.99, "import_duty_without_exemption"],
      [1, "bottle of perfume", 18.99, "basic_sales"],
      [1, "packet of headache pills", 9.75, "no_tax"],
      [3, "box of imported chocolates", 11.25, "import_duty_with_exemption"]
    ]
  end

  context "#parse" do
    context 'first input' do
      let(:subject) { described_class.new 'input_1' }

      it 'returns the array of products' do
        expect(subject.parse).to eq(input_1_array_content)
      end
    end

    context 'third input' do
      let(:subject) { described_class.new 'input_3' }

      it 'returns the array of products' do
        expect(subject.parse).to eq(input_3_array_content)
      end
    end
  end
end
