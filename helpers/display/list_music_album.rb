require_relative 'list'

class ListMusicAlbum < List
  def self.display(music_albums)
    puts 'No book available' if music_albums.empty?
    music_albums.each do |music_album|
      music_album_status = music_album.archived ? 'Archived' : 'Not Archived'
      puts "Music album id: #{music_album.id},published date :#{music_album.published_date}"
      puts "Archvied status : #{music_album_status}"
    end
  end
end
