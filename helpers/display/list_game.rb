require_relative 'list'

class ListGame < List
  def self.display(games)
    puts 'No game available' if games.empty?
    games.each do |game|
      game_status = game.archived ? 'Archived' : 'Not Archived'
      label = game.label.title
      source = game.source.name
      genre = game.genre.name
      author = game.author.first_name
      puts "game id:#{game.id}, label: #{label},  source: #{source}, genre: #{genre}"
      puts "Author: #{author},  published date: #{game.published_date}, archvied status: #{game_status}"
    end
  end
end
