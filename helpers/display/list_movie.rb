require_relative '../list'

class ListMovie < List
  def self.display(movies)
    puts 'No movie available' if movies.empty?
    movies.each do |movie|
      movie_status = movie.archived ? 'Archived' : 'Not Archived'
      label = movie.label.title || 'No label'
      source = movie.source.name || 'No source'
      genre = movie.genre.name || 'No genre'
      author = movie.author.first_name || 'No author'
      puts "movie id:#{movie.id}\t,label: #{label} \n source: #{source}\t genre: #{genre} \t author: #{author} \n published date : #{movie.published_date} \n  archvied status : #{movie_status}"
    end
  end
end
