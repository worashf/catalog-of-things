class Source
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name, id: nil)
    @id = id || Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.source = self
  end
end
