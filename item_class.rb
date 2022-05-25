class Item
  attr_accessor :id, :genre, :author, :label, :publish_date, :archived

  def initialize(genre, author, label, publish_date)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    (Time.now.year - @publish_date.to_i) >= 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
