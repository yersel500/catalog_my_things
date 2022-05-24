class Author
  attr_reader :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @id = rand(1..100_000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.author = self
    @items << item
  end
end
