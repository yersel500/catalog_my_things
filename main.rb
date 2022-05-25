require './app'
require './label'
require './item_class'
require './book'
require 'json'

def options
  puts 'Welcome to de app
  Please select a value:
  1) List all books
  2) List all labels
  3) List all genres
  4) List all albums
  5) List all authors
  6) List all games
  7) Add a label
  8) Add a genre
  9) Add a book
  10) Add an album
  11) Add a game
  12) Add an author
  13) Exit'
  option = gets.chomp.to_i
  run(option)
end

def run(option)
  option_catalog = %w[list_books list_labels list_genres list_albums list_authors list_games
                      create_label
                      create_genre
                      create_book
                      create_album
                      create_game
                      create_author
                      save_data]

  if option.between?(1, 13)
    @catalog.send(option_catalog[option - 1])
  else
    puts 'Invalid option, try again'
  end
  options
end

def main
  @catalog = App.new
  @catalog.load_data
  options
end

main
