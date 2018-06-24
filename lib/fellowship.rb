require 'pry'
require 'json'
require_relative 'fellow'

class Fellowship
  attr_reader :fellows

  def initialize(fellows = [])
    @fellows = fellows
  end

  def load_dataset(dataset = JSON.parse(File.read("data/fellows_dataset.json")))
    dataset.each do |data|
      fellows << Fellow.new(
        :id         => data['id'],
        :active     => data['isActive'],
        :age        => data['age'],
        :fellowship => data['fellowship'],
        :first_name => data['name']['first'],
        :last_name  => data['name']['last'],
        :email      => data['email'],
        :about      => data['about'],
        :registered => data['registered']
      )
    end

    sort_by_fellowship
  end

  private

  def sort_by_fellowship
    fellows.sort_by! {|fellow| fellow.fellowship}
  end
end
