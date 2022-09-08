require_relative 'list'

class ListMusicAlbum < List
  def self.display(music_albums)
    puts 'No book available' if music_albums.empty?
    music_albums.each do |music_album|
      music_album_status = music_album.archived ? 'Archived' : 'Not Archived'
      label = music_album.label.title
      source = music_album.source.name
      genre = music_album.genre.name
      author = music_album.author.first_name
      puts "Music album id: #{music_album.id},label: #{label}, source: #{source}"
      puts "Genre: #{genre},  author: #{author}"
      puts "published date : #{music_album.published_date}, archvied status : #{music_album_status}"
    end
  end
end
