require_relative 'create'
require './lib/music_album'
require_relative 'create_genre'
require_relative 'create_label'
require_relative 'create_source'
require_relative 'create_author'

class CreateMusicAlbum < Create
  def self.add
    label = CreateLabel.add
    source = CreateSource.add
    author = CreateAuthor.add
    genre = CreateGenre.add

    puts 'Published date (year): '
    published_date = gets.chomp.strip
    puts 'Enter on spotify:  True or False '
    on_spotify = gets.chomp.strip
    case on_spotify
    when 'T', 't', 'True', 'true'
      on_spotify = true
    when 'F', 'f', 'false', 'False'
      on_spotify = false
    end

    music_album = MusicAlbum.new(published_date, on_spotify: on_spotify)

    music_album.label = label
    music_album.source = source
    music_album.author = author
    music_album.genre = genre
    music_album
  end
end
