require_relative 'fellow'
require 'json'

class Fellowship
  attr_reader :groups

  def initialize(dataset = JSON.parse(File.read("data/fellows_dataset.json")))
    group_fellowships(dataset)
    count_average_age
  end

  def group_fellowships(dataset)
    @groups = dataset.each_with_object({}) do |data, groups|
      fellowship_object = create_fellow(data)

      if (groups.keys & fellowship_object.keys).empty?
        groups[fellowship_object.keys[0]] = {:fellows => fellowship_object.values}
      else
        groups[fellowship_object.keys[0]][:fellows].push(fellowship_object.values[0])
      end
    end
  end

  def count_average_age
    groups.keys.each do |fellowship|
      ages = groups[fellowship][:fellows].collect{|fellow| fellow.age}

      groups[fellowship][:average_age] = ages.sum / ages.length
    end
  end

  private

  def create_fellow(data)
    fellow = Fellow.new(
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

    {data['fellowship'] => fellow}
  end
end
