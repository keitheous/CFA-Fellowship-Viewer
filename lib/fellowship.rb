require_relative 'json_parser'
require_relative 'age'
require 'json'

class Fellowship
  attr_reader :groups, :dataset

  def initialize(dataset = JsonParser.new.load_fellows, age = Age)
    @age     = age.new(dataset.collect{|x| x.age})
  end

  def min_age
    age.min
  end

  def max_age
    age.max
  end
end
