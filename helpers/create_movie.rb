require_relative 'create'
require './lib/movie'
require_relative 'create_genre'
require_relative 'create_label'
require_relative 'create_source'
require_relative 'create_author'

class CreateMovie < Create
  def self.add
    label = CreateLabel.add
    source = CreateSource.add
    author = CreateAuthor.add
    genre = CreateGenre.add

    puts 'Published date (year): '
    published_date = gets.chomp.strip

    puts 'Enter silent:  True or False '
    silent = gets.chomp.strip
    case silent
    when 'T', 't', 'True', 'true'
      silent = true
    when 'F', 'f', 'false', 'False'
      silent = false
    end
    movie = Movie.new(published_date, silent)

    movie.label = label
    movie.source = source
    movie.author = author
    movie.genre = genre
    movie
  end
end
