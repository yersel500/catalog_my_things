require './item_class'
require './book'
require './label'
require 'json'

class App
  attr_accessor :labels, :books

  def initialize
    @labels = []
    @books = []
  end

  def load_labels
    if File.exist?('label.json')
      data = JSON.parse(File.read('label.json'))
      data.each do |label|
        my_label = Label.new(label['title'], label['color'])
        my_label.id = label['id']
        @labels << my_label
      end
    else
      []
    end
  end

  def load_books
    if File.exist?('item.json')
      data = JSON.parse(File.read('item.json'))
      data.each do |item|
        my_item = Book.new(item['genre'], item['author'], item['label'], item['publish_date'], item['publisher'],
                           item['cover_state'])
        my_item.id = item['id']
        @books << my_item
      end
    else
      []
    end
  end

  def load_data
    load_labels
    load_books
  end

  def create_label(title, color)
    @labels << Label.new(title, color)
  end

  def create_book(genre, author, label, publish_date, publisher, cover_state) # rubocop:disable Metrics/ParameterLists
    @books << Book.new(genre, author, label, publish_date, publisher, cover_state)
  end

  def list_labels
    @labels.each { |label| print "#{label.title} " }
    puts ''
  end

  def list_books
    @books.each { |book| puts "#{book.author} #{book.publisher}" }
  end

  def save_data
    File.write('label.json', JSON.generate(@labels))
    File.write('item.json', JSON.generate(@books))
  end
end
