require_relative 'list'

class ListMovie < List
  def self.display(movies)
    puts 'No movie available' if movies.empty?
    movies.each do |movie|
      movie_status = movie.archived ? 'Archived' : 'Not Archived'
      label = movie.label.title
      source = movie.source.name
      genre = movie.genre.name
      author = movie.author.first_name
      puts "Movie id: #{movie.id}, label: #{label}, source: #{source}, genre: #{genre}"
      puts "Author: #{author}, published date : #{movie.published_date}, archvied status: #{movie_status}"
    end
  end
end
