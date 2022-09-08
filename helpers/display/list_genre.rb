require_relative '../list'

class ListGenre < List
  def self.display(genres)
    puts 'No genres available' if genres.empty?
    genres.each do |genre|
      puts "genre id:#{genre.id}\t,  name : #{genre.name}"
    end
  end
end
