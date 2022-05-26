require './app'
require './label'
require './item_class'
require './book'
require 'json'

def options
  puts 'Welcome to de app
  Please select a value:
  1) List all books
  2) List all music albums
  3) List all games
  4) List all genres
  5) List all labels
  6) List all authors
  7) Add a book
  8) Add a music album
  9) Add a game
  10) Add an genre
  11) Add a label
  12) Add an author
  13) Exit'
  option = gets.chomp.to_i
  run(option)
end

def run(option)
  option_catalog = %w[list_books list_albums list_games list_genres list_labels list_authors
                      create_book create_album create_game create_genre create_label
                      create_author save_data]

  if option.between?(1, 13)
    @catalog.send(option_catalog[option - 1])
  else
    puts 'Invalid input, try again'
  end
  options
end

def main
  @catalog = App.new
  @catalog.load_data
  options
end

main
