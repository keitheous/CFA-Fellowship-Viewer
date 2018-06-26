require_relative 'json_parser'
require_relative 'age'
require_relative 'fellow'
require 'json'
require 'pry'

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

  def add_fellow(fellow_args = {}, fellow_class = Fellow)
    return require_fellow_details if fellow_args.empty?

    new_fellow = fellow_class.new(fellow_args)

    create_new_profile(new_fellow)
  end

  def max_age
    age.max
  end

  def min_age
    age.min
  end

  private

  def create_new_profile(fellow)
    age.add_new(fellow.age)

    dataset << fellow

    distribute_fellow(fellow)

    set_average_ages
  end

  def require_fellow_details
    puts "Details are required to register new Fellow."
  end

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
