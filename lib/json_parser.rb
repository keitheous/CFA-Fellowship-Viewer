require_relative 'fellow'
require 'json'

class JsonParser
  attr_reader :dataset

  def initialize(dataset = JSON.parse(File.read("data/fellows_dataset.json")))
    @dataset = dataset
  end

  def load_fellows(fellow_object = Fellow)
    dataset.map do |data|
      fellow_object.new(
        :id         => data['id'],
        :active     => data['isActive'],
        :age        => data['age'],
        :fellowship => data['fellowship'],
        :first_name => data['name']['first'],
        :last_name  => data['name']['last'],
        :email      => data['email'],
        :about      => data['about'],
        :registered => data['registered']
      )
    end
  end
end
