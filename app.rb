require './item_class'
require './book'
require './label'

class App
  def initialize
    @labels = []
    @books = []
  end

  def create_label(title, color)
    @labels << Label.new(title, color)
  end

  def create_book(genre, author, label, publish_date, publisher, cover_state)
    @books << Book.new(genre, author, label, publish_date, publisher, cover_state)
  end
end
