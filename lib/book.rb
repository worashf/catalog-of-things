require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, published_date, archived: false, id: nil)
    super(published_date, archived: archived, id: id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_hash
    hash = {
      class: 'Book',
      id: @id,
      publisher: @publisher,
      cover_state: @cover_state,
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
    return true if super || @cover_state == 'Bad'

    false
  end
end
