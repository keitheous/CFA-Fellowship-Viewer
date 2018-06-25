class Age
  attr_reader :min_age, :max_age

  def initialize(ages)
    @min = ages.min
    @max = ages.max
  end
end
