require_relative '../../lib/input_parser'
require_relative '../../helpers/input_parser_helper'

describe InputParserHelper do
  let(:subject) { InputParser.new('input_1').extend(described_class) }
  let(:first_product) { ["2", "book", "at", "12.49"] }
  let(:second_product) { ["1", "chocolate", "bar", "at", "0.85"] }
  let(:third_product) { [1, "imported bottle of perfume", 27.99, "import_duty_without_exemption"] }
  let(:fourth_product) { [1, "bottle of perfume", 18.99, "basic_sales"] }

  context "#one_word_item" do
    it 'returns true' do
      expect(subject.one_word_product?(first_product)).to be_truthy
    end

    it 'returns false' do
      expect(subject.one_word_product?(second_product)).to be_falsy
    end
  end

  context "#is_exempted_product?" do
    let(:exempted_product) { "packet of headache pills" }
    let(:tax_product) { "bottle of perfume" }

    it 'returns true' do
      expect(subject.is_exempted_product?(exempted_product)).to be_truthy
    end

    it 'returns false' do
      expect(subject.is_exempted_product?(tax_product)).to be_falsy
    end
  end

  context "#is_imported_product" do
    let(:imported_product) { "imported bottle of perfume" }
    let(:local_product) { "bottle of perfume" }

    it 'returns true' do
      expect(subject.is_imported_product?(imported_product)).to be_truthy
    end

    it 'returns false' do
      expect(subject.is_imported_product?(local_product)).to be_falsy
    end
  end

  context "#one_word_item" do
    let(:imported_product_without_exemption) { "imported bottle of perfume" }
    let(:local_product) { "bottle of perfume" }
    let(:no_tax_product) { "packet of headache pills" }
    let(:imported_product_with_exemption) { "box of imported chocolates" }

    it 'returns true' do
      expect(subject.taxable(imported_product_without_exemption)).to eq('import_duty_without_exemption')
    end

    it 'returns false' do
      expect(subject.taxable(local_product)).to eq('basic_sales')
    end

    it 'returns false' do
      expect(subject.taxable(imported_product_with_exemption)).to eq('import_duty_with_exemption')
    end

    it 'returns false' do
      expect(subject.taxable(no_tax_product)).to eq('no_tax')
    end
  end
end
