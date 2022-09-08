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
    hash[:label_id] = @label.id unless @label.nil?
    hash[:source_id] = @source.id unless @source.nil?
    hash[:author_id] = @author.id unless @author.nil?
    hash[:genre_id] = @genre.id unless @genre.nil?
    hash
  end

  def can_be_archived?
    true if super || @silent == true
    false
  end
end
