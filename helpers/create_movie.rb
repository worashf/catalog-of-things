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
    movie = Movie.new(published_date, silent: silent)

    movie.label = label
    movie.source = source
    movie.author = author
    movie.genre = genre
    movie
  end

  def self.create_object(movies, authors, labels, genres, sources)
    movies.map do |movie|
      new_movie = Movie.new(movie[:published_date], silent: movie[:silent],
                                                    archived: movie[:archived], id: movie[:id])
      label = labels.find { |l| l.id == movie[:label_id] }
      new_movie.label = label
      source = sources.find { |s| s.id == movie[:source_id] }
      new_movie.source = source
      genre = genres.find { |g| g.id == movie[:genre_id] }
      new_movie.genre = genre
      author = authors.find { |au| au.id == movie[:author_id] }
      new_movie.author = author
      new_movie
    end
  end
end
