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

  def self.create_object(genres)
    genres.map do |genre|
      Genre.new(genre[:name], id: genre[:id])
    end
  end
end
