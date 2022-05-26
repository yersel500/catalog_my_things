class Item
  attr_reader :publish_date
  attr_accessor :id, :archived, :genre, :author, :label

  def initialize(genre, author, label, publish_date)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    (Time.now.year - @publish_date[6..10].to_i) >= 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
