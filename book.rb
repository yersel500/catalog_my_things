require './item_class'

class Book < Item
  def initialize(genre, author, label, publish_date, archived, publisher, cover_state)
    super(genre, author, label, publish_date, archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    @publish_date >= 10 || @cover_state == 'bad'
  end
end
