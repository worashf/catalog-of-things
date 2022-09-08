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

  def self.create_object(sources)
    sources.map do |source|
      Source.new(source[:name], source[:id])
    end
  end
end
