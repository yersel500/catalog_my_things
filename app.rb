require './item_class'
require './book'
require './label'
require './game_class'
require './author_class'
require './music_album'
require './genre'
require 'json'

class App # rubocop:disable Metrics/ClassLength
  attr_accessor :labels, :books, :genres, :music_albums, :authors

  def initialize
    @labels = []
    @books = []
    @genres = []
    @music_albums = []
    @authors = []
    @games = []
  end

  def load_albums
    if File.exist?('music_albums.json')
      data = JSON.parse(File.read('music_albums.json'))
      data.each do |album|
        music_albums = MusicAlbum.new(album['genre'], album['author'], album['label'], album['publish_date'],
                                      album['on_spotify'])
        music_albums.id = album['id']
        @books << music_albums
      end
    else
      []
    end
  end

  def load_genres
    if File.exist?('genres.json')
      data = JSON.parse(File.read('genres.json'))
      data.each do |genre|
        my_genre = Genre.new(genre['title'], genre['color'])
        my_genre.id = genre['id']
        @genres << my_genre
      end
    else
      []
    end
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

  def load_games
    if File.exist?('games.json')
      data = JSON.parse(File.read('games.json'))
      data.each do |new_game|
        game = Game.new(new_game['genre'], new_game['author'], new_game['label'], new_game['publish_date'],
                        new_game['multiplayer'], new_game['last_played_at'])
        game.id = new_game['id']
        game.archived = new_game['archived']
        @games << game
      end
    else
      []
    end
  end

  def load_authors
    if File.exist?('authors.json')
      data = JSON.parse(File.read('authors.json'))
      data.each do |new_author|
        author = Author.new(new_author['first_name'], new_author['last_name'])
        author.id = new_author['id']
        @authors << author
      end
    else
      []
    end
  end

  def load_data
    load_labels
    load_genres
    load_books
    load_games
    load_authors
    load_albums
  end

  # Option 5:
  def create_label(title, color)
    @labels << Label.new(title, color)
  end

  # Option 6:
  def create_genre
    puts "Name of the genre: \n"
    name = gets.chomp
    @genres << Genre.new(name)
    puts "Genre #{name} succesfully created!"
  end

  # Option 8:
  def create_album
    puts "Genre: \n"
    genre = gets.chomp
    puts "Author: \n"
    author = gets.chomp
    puts "Select a label from the list: \n"
    list_labels
    label = @labels[gets.chomp.to_i]
    puts "When was this album published? \n"
    puts 'MM-DD-YYYY: '
    publish_date = gets.chomp
    puts "Is this album on Spotify? \n"
    on_spotify = define_boolean
    @music_albums << MusicAlbum.new(genre, author, label, publish_date, on_spotify)
    puts "Album from #{author} succesfully created!"
  end

  # Option 7:
  def create_book(genre, author, label, publish_date, publisher, cover_state) # rubocop:disable Metrics/ParameterLists
    @books << Book.new(genre, author, label, publish_date, publisher, cover_state)
  end

  # Option 2:
  def list_labels
    @labels.each { |label| print "#{label.title} " }
    puts ''
  end

  # Option 3:
  def list_genres
    @genres.each { |genre| print "#{genre.name} " }
    puts ''
  end

  # Option 4:
  def list_albums
    @music_albums.each { |album| puts "#{album.author} #{album.on_spotify}" }
  end

  # option 1:
  def list_books
    @books.each { |book| puts "#{book.author} #{book.publisher}" }
  end

  def list_games
    return puts 'There are no games yet' if @games.empty?

    @games.each_with_index do |game, index|
      puts "#{index}) ID: #{game.id}, Genre: #{game.genre}, Author: #{game.author},
      Publish date: #{game.publish_date}, Multiplayer: #{game.multiplayer},
      Last Played: #{game.last_played_at}"
    end
  end

  def list_authors
    @authors.each_with_index do |author, index|
      puts "#{index}) First Name: #{author.first_name}, Last Name: #{author.last_name}"
    end
  end

  def game_details
    genre = define_genre
    author = define_author
    label = define_label
    puts "When was this game published? \n"
    publish_date = define_date
    puts "Is this game multiplayer? \n"
    multiplayer = define_boolean
    puts "When was this game last played? \n"
    last_played_at = define_date
    [genre, author, label, publish_date, multiplayer, last_played_at]
  end

  def define_author
    puts "Author: \n"
    list_authors
    @authors[gets.chomp.to_i]
  end

  def define_genre
    puts "Genre: \n"
    list_genres
    @genres[gets.chomp.to_i]
  end

  def define_label
    puts "Select a label from the list: \n"
    list_labels
    @labels[gets.chomp.to_i]
  end

  def define_date
    puts 'MM/DD/YYYY: '
    gets.chomp
  end

  def define_boolean
    puts 'y/n: '
    case gets.chomp
    when 'y'
      true
    when 'n'
      false
    end
  end

  def create_game
    genre, author, label, publish_date, multiplayer, last_played_at = game_details
    @games << Game.new(genre, author, label, publish_date, multiplayer, last_played_at)
    puts "Game by #{author} succesfully created!"
  end

  def create_author
    puts "First Name: \n"
    first_name = gets.chomp
    puts "Last Name: \n"
    last_name = gets.chomp
    @authors << Author.new(first_name, last_name)
    puts 'Author created successfully!'
  end

  def save_data
    File.write('label.json', JSON.generate(@labels))
    File.write('genres.json', JSON.generate(@genres))
    File.write('item.json', JSON.generate(@books))
    File.write('games.json', JSON.generate(@games))
    File.write('authors.json', JSON.generate(@authors))
    File.write('music_albums.json', JSON.generate(@music_albums))
  end
end
