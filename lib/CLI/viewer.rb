require_relative '../fellowship'

class Viewer
  SPACES = [10, 7, 23, 3, 24].freeze
  attr_reader :groups

  def initialize(groups = Fellowship.new.sort_groups.groups)
    @groups = groups
  end

  def display_fellowships
    print_header
    print_rows
  end

  private

  def horizontal_line
    puts "+==========+=======+=======================+===+========================+"
  end

  def print_header
    horizontal_line
    header_text
    horizontal_line
  end

  def header_text
    row = []
    row << word_wrapper('Fellowship', SPACES[0])
    row << word_wrapper('Avg Age', SPACES[1])
    row << word_wrapper('Fellow Name', SPACES[2])
    row << word_wrapper('Age', SPACES[3])
    row << word_wrapper('ID', SPACES[4])

    print_row(row)
  end

  def print_rows
    groups.each do |name, details|
      row_builder(name, details)
      horizontal_line
    end
  end

  def row_builder(name, details)
    average_age = details[:average_age]

    details[:fellows].each_with_index do |fellow, index|
      row = []

      row << word_wrapper(first_row_label(name, index), SPACES[0])
      row << word_wrapper(first_row_label(average_age, index), SPACES[1])
      row << word_wrapper(fellow.full_name, SPACES[2])
      row << word_wrapper(fellow.age, SPACES[3])
      row << word_wrapper(fellow.id, SPACES[4])

      print_row(row)
    end
  end

  def word_wrapper(word, space)
    if word.to_s.length > space
      word.to_s.slice(0, space - 2) + ".."
    else
      word.to_s.ljust(space)
    end
  end

  def first_row_label(label, index)
    index.zero? ? label : ''
  end

  def print_row(row)
    puts "|" + row.join('|') + "|"
  end
end
