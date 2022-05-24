require './item_class'
require './book'
require './label'

class App
  attr_accessor :labels, :books

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

  def list_labels
    @labels.each { |label| print "#{label.title} " }
    puts ''
  end

  def list_books
    @books.each { |book| puts "#{book.author} #{book.publisher}" }
  end
end
