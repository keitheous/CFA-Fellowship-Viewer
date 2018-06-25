require_relative 'json_parser'
require_relative 'age'
require 'json'

class Fellowship
  attr_reader :groups, :dataset, :age

  def initialize(dataset = JsonParser.new.load_fellows, age = Age)
    @age     = age.new(dataset.collect{|data| data.age})

    @dataset = dataset
    @groups  = {}
  end

  def sort_groups
    dataset.each do |data|
      distribute_fellow(data)
    end

    set_average_ages
    self
  end

  def max_age
    age.max
  end

  def min_age
    age.min
  end

  def set_average_ages
    groups.keys.each do |key|
      average = age.calculate_average_per_group(groups[key][:fellows])

      groups[key].merge!(:average_age => average)
    end
  end

  private

  def distribute_fellow(fellow)
    unless groups.keys.include?(fellow.fellowship)
      groups[fellow.fellowship] = {:fellows => [fellow]}
    else
      groups[fellow.fellowship][:fellows] << fellow
    end
  end
end
