require_relative 'json_parser'
require_relative 'age'
require 'json'

class Fellowship
  attr_reader :groups, :dataset, :age

  def initialize(dataset = JsonParser.new.load_fellows.dataset, age = Age)
    @age     = age.new(dataset.collect{|data| data.age})

    @dataset = dataset
    @groups  = {}
  end

  def sort_groups
    dataset.each {|data| distribute_fellow(data)}

    set_average_ages

    self
  end

  def max_age
    age.max
  end

  def min_age
    age.min
  end

  private

  def distribute_fellow(fellow)
    if existing_fellowship?(fellow.fellowship)
      register_new_fellowship_member(fellow)
    else
      create_fellowship_with_member(fellow)
    end
  end

  def existing_fellowship?(fellowship_name)
    groups.keys.include?(fellowship_name)
  end

  def register_new_fellowship_member(fellow)
    groups[fellow.fellowship][:fellows] << fellow
  end

  def create_fellowship_with_member(fellow)
    groups[fellow.fellowship] = {:fellows => [fellow]}
  end

  def set_average_ages
    groups.keys.each do |key|
      average = age.calculate_average_per_group(groups[key][:fellows])

      groups[key].merge!(:average_age => average)
    end
  end
end
