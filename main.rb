require './app'
require './label'
require './item_class'
require './book'
require 'json'

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
  3) List all authors
  4) List all games
  5) Add a label
  6) Add a book
  7) Add a game
  8) Exit'
  gets.chomp
end

def run(catalog) # rubocop:disable Metrics/CyclomaticComplexity,Metrics/MethodLength
  loop do
    case options
    when '1'
      catalog.list_books
    when '2'
      catalog.list_labels
    when '3'
      catalog.list_authors
    when '4'
      catalog.list_games
    when '5'
      create_label_ui(catalog)
    when '6'
      create_book_ui(catalog)
    when '7'
      catalog.create_game
    when '8'
      catalog.save_data
      break
    end
  end
end

def main
  catalog = App.new
  catalog.load_data
  run(catalog)
end

main
