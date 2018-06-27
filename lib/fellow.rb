class Fellow
  attr_reader :id, :active, :age, :fellowship, :first_name, :last_name, :email,
    :about, :registered

  def initialize(args)
    @id         = args[:id]
    @active     = args[:active]
    @age        = args[:age]
    @fellowship = args[:fellowship]
    @first_name = args[:first_name]
    @last_name  = args[:last_name]
    @email      = args[:email]
    @about      = args[:about]
    @registered = args[:registered]
  end

  def full_name
    first_name + ' ' + last_name
  end

  def to_s
    puts [
      "Name       : #{first_name} #{last_name}",
      "ID         : #{id}",
      "Status     : #{active ? 'Active' : 'Inactive'} Member",
      "Age        : #{age}",
      "Email      : #{email}",
      "Registered : #{registered}",
      "About      :\n#{about}"
    ].unshift("").join("\n")
  end
end
