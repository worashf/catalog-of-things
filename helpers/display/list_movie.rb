require_relative 'list'

class ListMovie < List
  def self.display(movies)
    puts 'No movie available' if movies.empty?
    movies.each do |movie|
      movie_status = movie.archived ? 'Archived' : 'Not Archived'
      puts "Movie id: #{movie.id}, published date : #{movie.published_date}, archvied status: #{movie_status}"
    end
  end
end
