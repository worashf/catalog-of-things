require_relative '../list'

class ListGame < List
  def self.display(games)
    puts 'No game available' if games.empty?
    games.each do |game|
      game_status = game.archived ? 'Archived' : 'Not Archived'
      label = game.label.title || 'No label'
      source = game.source.name || 'No source'
      genre = game.genre.name || 'No genre'
      author = game.author.first_name || 'No author'
      puts "game id:#{game.id}\t,label: #{label} \n source: #{source}\t genre: #{genre} \t author: #{author} \n published date : #{game.published_date} \n  archvied status : #{game_status}"
    end
  end
end
