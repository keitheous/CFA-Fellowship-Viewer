require_relative 'fellowship'
require_relative 'viewer'

class CLI
  attr_reader :fellowship, :viewer

  def initialize(fellowship = Fellowship.new.sort_groups)
    @fellowship = fellowship
  end

  def run
    loop do
      main_fellowship_instructions

      case gets.chomp
      when 'q' then return exit_application
      when '1' then display_fellowship_groups
      when '2' then access_fellows_menu
      else invalid_option
      end
    end
  end

  def display_fellowship_groups(viewer = Viewer)
    viewer.new(fellowship.groups).display_fellowships
  end

  def access_fellows_menu
    loop do
      fellows_instructions

      case gets.chomp
      when 'q' then return fellowship_menu
      when 'y' then display_youngest_fellow
      when 'e' then display_eldest_fellow
      when 'a' then add_fellow
      when 's' then search_fellow
      else invalid_option
      end
    end
  end

  private

  def main_fellowship_instructions
    puts [
      "============================================",
      "Code for Australia: Fellowships",
      "Press (q) to Exit",
      "Press (1) to view Fellowships groups",
      "Press (2) to access Fellows menu",
      "============================================"
    ].unshift("").join("\n")
  end

  def fellows_instructions
    puts [
      "============================================",
      "Code for Australia: Fellows",
      "Press (q) to Exit",
      "Press (y) to View Youngest fellow",
      "Press (e) to View Eldest fellow",
      "Press (a) to Add new fellow",
      "Press (s) to Search fellow by ID or email",
      "============================================"
    ].unshift("").join("\n")
  end

  def display_youngest_fellow
    puts "Youngest Fellow(s)"
    print_fellows(search_fellow_by('age', fellowship.min_age))
  end

  def display_eldest_fellow
    puts "Eldest Fellow(s)."
    print_fellows(search_fellow_by('age', fellowship.max_age))
  end

  def search_fellow_by(fellow_attribute, value)
    fellowship.dataset.select{|fellow| fellow.send(fellow_attribute) == value}
  end

  def search_fellow
    puts "Searching Fellow. Please enter ID or email"
    input = gets.chomp
    search_result = search_fellow_by('id', input) | search_fellow_by('email', input) #using divergent instead of || -> readme

    return unregistered_fellow if search_result.empty?
    print_fellows(search_result)
  end

  def print_fellows(fellows)
    fellows.each{ |fellow| fellow.to_s }
  end

  def add_fellow
    puts "Adding Fellow"
  end

  def unregistered_fellow
    "Fellow not found.."
  end

  def invalid_option
    puts "Sorry invalid option. Read the instructions and try again.."
  end

  def exit_application
    puts "Exiting application. Goodbye.."
  end

  def fellowship_menu
    puts "Returning to Fellowships Menu.."
  end
end

CLI.new.run
