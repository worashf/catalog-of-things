class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name, id: nil)
    @id = id.nil? ? Random.rand(1..1000) : id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def to_hash
    {
      class: 'Genre',
      name: @name,
      id: @id
    }
  end
end
