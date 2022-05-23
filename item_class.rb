class Item
  attr_accessor :id, :genre, :author, :label, :publish_date, :archived

  def initialize(genre, author, label, publish_date, archived)
    @id = Random(1..1000)
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    @publish_date >= 10
  end

  def move_to_archived
    @archived = true if can_be_archived?
  end
end
