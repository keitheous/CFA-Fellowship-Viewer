require 'spec_helper'

RSpec.describe Age do
  let(:ages)        { [12, 10, 32, 44, 100] }
  let(:age_class)   { Age.new(ages) }

  let(:mock_dataset){ JSON.parse(File.read("spec/mock_data/mock_fellows_data.json")) }
  let(:json_parser) { JsonParser.new(mock_dataset).load_fellows }

  describe '.initialize' do
    it 'sets min & max attrs' do
      expect(age_class.min).to eq(10)
      expect(age_class.max).to eq(100)
    end
  end

  describe '#calculate_average_per_group' do
    it 'expects params to be an array containing Fellows' do
      expect(json_parser.dataset.class).to eq(Array)
      expect(json_parser.dataset.first.class).to eq(Fellow)
    end

    it 'returns average age for group of Fellows' do
      expect(age_class.calculate_average_per_group(json_parser.dataset)).to eq(50)
    end
  end
end
