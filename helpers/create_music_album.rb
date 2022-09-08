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

  def self.create_object(music_albums, authors, labels, genres, sources)
    music_albums.map do |m|
      new_music = MusicAlbum.new(
        m[:published_date], on_spotify: m[:on_spotify], archived: m[:archived], id: m[:id]
      )
      label = labels.find { |l| l.id == m[:label_id] }
      new_music.label = label
      source = sources.find { |s| s.id == m[:source_id] }
      new_music.source = source
      genre = genres.find { |g| g.id == m[:genre_id] }
      new_music.genre = genre
      author = authors.find { |au| au.id == m[:author_id] }
      new_music.author = author
      new_music
    end
  end
end
