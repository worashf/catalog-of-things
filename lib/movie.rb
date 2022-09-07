require_relative 'item'

class Movie < Item
  attr_accessor :silent

  def initialize(published_date, silent: false, archived: false, id: nil)
    super(published_date, archived: archived, id: id)
    @silent = silent
  end

  def to_hash
    hash = {
      class: 'Movie',
      id: @id,
      silent: @silent,
      published_date: @published_date,
      archived: @archived

    }
    hash[:label] = @label.id unless @label.nil?
    hash[:source] = @source.id unless @source.nil?
    hash[:author] = @author.id unless @author.nil?
    hash[:genre] = @genre.id unless @genre.nil?
  end

  def can_be_archived?
    true if super || @silent == true
    false
  end
end
