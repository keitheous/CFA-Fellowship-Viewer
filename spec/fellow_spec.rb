require 'spec_helper'

RSpec.describe Fellow do
  let(:fellow_args) {
    {
      :id         => "5b2a11c6e8ae88891060533c",
      :active     => true,
      :age        => 34,
      :fellowship => "ZESE",
      :first_name => "Keith",
      :last_name  => "Chong",
      :email      => "moreno.lyons@zese.net",
      :about      => "Hullo!",
      :registered => "Monday, June 4, 2018 6:52 PM"
    }
  }

  let(:fellow) { Fellow.new(fellow_args) }

  describe '.initialize' do
    it 'creates a Fellow object' do
      expect(fellow.class).to eq(Fellow)
    end

    it 'creates fellow with id' do
      expect(fellow.id).to eq('5b2a11c6e8ae88891060533c')
    end

    it 'creates fellow with status (active or inactive)' do
      expect(fellow.active).to eq(true)
    end

    it 'creates fellow with age' do
      expect(fellow.age).to eq(34)
    end

    it 'creates fellow with fellowship' do
      expect(fellow.fellowship).to eq('ZESE')
    end

    it 'creates fellow with first name' do
      expect(fellow.first_name).to eq('Keith')
    end

    it 'creates fellow with email' do
      expect(fellow.email).to eq('moreno.lyons@zese.net')
    end

    it 'creates fellow with registration info' do
      expect(fellow.registered).to eq("Monday, June 4, 2018 6:52 PM")
    end

    it 'creates fellow with about info' do
      expect(fellow.about).to eq("Hullo!")
    end
  end
end
