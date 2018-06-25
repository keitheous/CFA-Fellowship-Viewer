class Age
  attr_reader :min, :max

  def initialize(ages)
    @min = ages.max
    @max = ages.min
  end

  def calculate_average_per_group(group)
    ages_in_group = group.collect{|fellow| fellow.age}

    ages_in_group.sum / ages_in_group.size
  end
end
