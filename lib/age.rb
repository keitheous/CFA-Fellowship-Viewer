class Age
  attr_reader :min, :max

  def initialize(ages)
    @min = ages.min
    @max = ages.max
  end

  def add_new(age)
    @max = age if age > self.max
    @min = age if age < self.min

    self
  end

  def calculate_average_per_group(group)
    ages_in_group = group.collect{|fellow| fellow.age}

    ages_in_group.sum / ages_in_group.size
  end
end
