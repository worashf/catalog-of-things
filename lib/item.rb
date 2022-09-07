require 'date'

class Item
  attr_accessor :published_date
  attr_reader :id, :archived, :label, :source, :author, :genre

  def initialize(published_date, archived: false, id: nil)
    @id = id || Random.rand(1..1000)
    @published_date = Date.parse(published_date)
    @archived = archived
  end

  def source=(source)
    return if source.nil?

    @source = source

    source.add_item(self) unless source.items.includes?(self)
  end

  def genre=(genre)
    return if genre.nil?

    @genre = genre
    genre.add_item(self) unless genre.items.includes?(self)
  end

  def author=(author)
    return if author.nil?

    @author = author
    author.add_item(self) unless author.items.includes?(self)
  end

  def label=(label)
    return if label.nil? # return if label is nil

    @label = label
    label.add_item(self) unless label.items.includes?(self) # add label to items array  if it was not in the items
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    current_year = Date.today.year
    current_year - @published_date.year > 10
  end
end
