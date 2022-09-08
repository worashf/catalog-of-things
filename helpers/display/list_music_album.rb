require_relative '../list'

class ListMusicAlbum < List
  def self.display(music_albums)
    puts 'No book available' if music_albums.empty?
    music_albums.each do |music_album|
      music_album_status = music_album.archived ? 'Archived' : 'Not Archived'
      label = music_album.label.title || 'No label'
      source = music_album.source.name || 'No source'
      genre = music_album.genre.name || 'No genre'
      author = music_album.author.first_name || 'No author'
      puts "book id:#{music_album.id}\t,label: #{label} \n source: #{source}\t genre: #{genre} \t author: #{author} \n published date : #{music_album.published_date} \n  archvied status : #{music_album_status}"
    end
  end
end
