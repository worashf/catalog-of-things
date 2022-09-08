require_relative 'create'
require './lib/game'
require_relative 'create_genre'
require_relative 'create_label'
require_relative 'create_source'
require_relative 'create_author'

class CreateGame < Create
  def self.add
    label = CreateLabel.add
    source = CreateSource.add
    author = CreateAuthor.add
    genre = CreateGenre.add

    puts 'Enter multiplayer:  True or False'
    multiplayer = gets.chomp.strip
    puts 'Enter last played date (year): '
    last_played = gets.chomp.strip
    puts 'Published date (year): '
    published_date = gets.chomp.strip
    game = Game.new(multiplayer, last_played, published_date)

    game.label = label unless label.nil?
    game.source = source unless source.nil?
    game.author = author unless author.nil?
    game.genre = genre unless genre.nil?
    game
  end

  def self.create_object(games, authors, labels, genres, sources)
    games.map do |game|
      new_game = Game.new(game[:multiplayer], game[:last_played],
                          game[:published_date], archived: game[:archived], id: game[:id])
      label = labels.find { |l| l.id == game[:label_id] }
      new_game.label = label
      source = sources.find { |s| s.id == game[:source_id] }
      new_game.source = source
      genre = genres.find { |g| g.id == game[:genre_id] }
      new_game.genre = genre
      author = authors.find { |au| au.id == game[:author_id] }
      new_game.author = author
      new_game
    end
  end
end
