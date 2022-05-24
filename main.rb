require './app'
require './label'
require './item_class'
require './book'

def create_book_ui(catalog)
  puts 'Enter genre'
  genre = gets.chomp
  puts 'Enter author'
  author = gets.chomp
  puts 'Select label by index'
  catalog.list_labels
  index = gets.chomp.to_i
  label = catalog.labels[index]
  puts 'Insert the publish date'
  publish_date = gets.chomp
  puts 'Insert publisher'
  publisher = gets.chomp
  puts 'Insert cover state'
  cover_state = gets.chomp
  catalog.create_book(genre, author, label, publish_date, publisher, cover_state)
  puts 'Book was created succesfully'
end

def create_label_ui(catalog)
  puts 'Enter title'
  title = gets.chomp
  puts 'Enter color'
  color = gets.chomp
  catalog.create_label(title, color)
  puts 'Label was created succesfully'
end

def options
  puts 'Welcome to de app
  Please select a value:
  1) List all books
  2) List all labels
  3) Add a label
  4) Add a book
  5) Exit'
  gets.chomp
end

def run(catalog)
  loop do
    case options
    when '1'
      catalog.list_books
    when '2'
      catalog.list_labels
    when '3'
      create_label_ui(catalog)
    when '4'
      create_book_ui(catalog)
    when '5'
      break
    end
  end
end

def main
  catalog = App.new
  run(catalog)
end

main
