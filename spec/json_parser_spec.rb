require 'spec_helper'

RSpec.describe JsonParser do
  let(:dataset)     { JSON.parse(File.read("spec/mock_data/mock_fellows_data.json")) }
  let(:json_parser) { JsonParser.new(dataset) }

  describe '.initialize' do
    it 'creates dataset array' do
      expect(json_parser.dataset.size).to eq(2)
      expect(json_parser.dataset.class).to eq(Array)
    end
  end

  describe '#load_fellows' do
    before do
      json_parser.load_fellows
    end

    it 'maps dataset with 2 Fellow Objects' do
      expect(json_parser.dataset.size).to eq(2)
      expect(json_parser.dataset.first.class).to eq(Fellow)
      expect(json_parser.dataset.first.first_name).to eq('Edward')
      expect(json_parser.dataset.last.class).to eq(Fellow)
      expect(json_parser.dataset.last.first_name).to eq('Richie')
    end
  end
end
