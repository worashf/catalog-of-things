require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(published_date, on_spotify: false, archived: false, id: nil)
    super(published_date, archived: archived, id: id)
    @on_spotify = on_spotify
  end

  def to_hash
    hash = {
      class: 'MusicAlbum',
      id: @id,
      on_spotify: @on_spotify,
      published_date: @published_date,
      archived: @archived

    }
    hash[:label_id] = @label.id unless @label.nil?
    hash[:source_id] = @source.id unless @source.nil?
    hash[:author_id] = @author.id unless @author.nil?
    hash[:genre_id] = @genre.id unless @genre.nil?
    hash
  end

  def can_be_archived?
    return true if super && @on_spotify == true

    false
  end
end
