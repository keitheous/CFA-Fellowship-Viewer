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

  def to_s
    puts [
      "Name       : #{first_name} #{last_name}",
      "ID         : #{id}",
      "Status     : #{active ? 'Active' : 'Inactive'} Member",
      "Age        : #{age}",
      "Email      : #{email}",
      "Registered : #{registered}",
      "About      :",
      "#{about}"
    ].unshift("").join("\n")
  end
end
#
# args = {
#   :id         => "5b2a11c6e8ae88891060533c",
#   :active     => true,
#   :age        => 34,
#   :fellowship => "ZESE",
#   :first_name => "Keith",
#   :last_name  => "Chong",
#   :email      => "moreno.lyons@zese.net",
#   :about      => "Anim culpa duis id qui laboris quis. Fugiat Lorem laboris irure veniam veniam labore nulla elit laboris esse. Eu consectetur fugiat in est fugiat pariatur aliqua ut adipisicing sit non proident officia culpa. Voluptate velit ex id aliquip aliquip fugiat amet labore non consequat. Consequat cillum mollit ut consectetur aliquip sunt velit id et excepteur aute. Irure non irure esse nulla eiusmod adipisicing consequat dolore laboris. Ea excepteur ipsum dolor enim exercitation aute sit tempor laboris ad velit.",
#   :registered => "Monday, June 4, 2018 6:52 PM"
# }
#
# x = Fellow.new(args)
# binding.pry
