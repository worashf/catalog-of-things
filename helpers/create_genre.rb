require_relative 'create'
require './lib/genre'

class CreateGenre < Create
  def self.add
    puts '---- Add genre information -----'
    puts 'Genre name: '
    name = gets.chomp.strip
    genre = Genre.new(name)
    puts 'Genre created seccussfuly' unless genre.nil?
    genre
  end
end
