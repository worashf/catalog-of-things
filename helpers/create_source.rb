require './lib/source'
require_relative 'create'

class CreateSource < Create
  def self.add
    puts '---- Add source information -----'
    puts 'Enter Source:  '
    name = gets.chomp.strip
    source = Source.new(name)
    puts 'Source created seccussfuly' unless source.nil?
    source
  end
end
