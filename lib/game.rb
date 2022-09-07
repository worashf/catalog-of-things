require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played

  def initialize(multiplayer, last_played, published_date, archived: false, id: nil)
    super(published_date, archived: archived, id: id)
    @multiplayer = multiplayer
    @last_played = last_played
  end

  def to_hash
    hash = {
      class: 'MusicAlbum',
      id: @id,
      published_date: @published_date,
      archived: @archived,
      multiplayer: @multiplayer,
      last_played: @last_played

    }
    hash[:label] = @label.id unless @label.nil?
    hash[:source] = @source.id unless @source.nil?
    hash[:author] = @author.id unless @author.nil?
    hash[:genre] = @genre.id unless @genre.nil?
  end

  def can_be_archived?
    return true if super && last_played > 2

    false
  end
end
