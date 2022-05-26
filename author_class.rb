class Author
  attr_reader :first_name, :last_name, :item_class
  attr_accessor :id, :items

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

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'first_name' => @first_name,
      'last_name' => @last_name
    }.to_json(*args)
  end
end
