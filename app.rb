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

  def params(item)
    genre = Genre.new(item['genre']['name'])
    genre.id = item['genre']['id']
    author = Author.new(item['author']['first_name'], item['author']['last_name'])
    author.id = item['author']['id']
    label = Label.new(item['label']['title'], item['label']['color'])
    label.id = item['label']['id']

    [genre, author, label]
  end

  def params_exists?
    abort('There are no genres yet, try adding one! => 10') if @genres.empty?
    abort('There are no labels yet, try adding one! => 11') if @labels.empty?
    abort('There are no authors yet, try adding one! => 12') if @authors.empty?
  end

  def load_albums
    if File.exist?('music_albums.json')
      data = JSON.parse(File.read('music_albums.json'))
      data.each do |album|
        genre, author, label = params(album)

        music_album = MusicAlbum.new(genre, author, label, album['publish_date'], album['on_spotify'])
        music_album.id = album['id']
        @music_albums << music_album
      end
    else
      []
    end
  end

  def load_genres
    if File.exist?('genres.json')
      data = JSON.parse(File.read('genres.json'))
      data.each do |genre|
        my_genre = Genre.new(genre['name'])
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
        genre, author, label = params(item)
        my_item = Book.new(genre, author, label, item['publish_date'], item['publisher'], item['cover_state'])
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
        genre, author, label = params(new_game)
        game = Game.new(genre, author, label, new_game['publish_date'], new_game['multiplayer'],
                        new_game['last_played_at'])
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
    load_authors
    load_books
    load_games
    load_albums
  end

  # Option 5:
  def create_label
    puts 'Input the title for this label:'
    title = gets.chomp
    puts 'Input the color for this label:'
    color = gets.chomp
    @labels << Label.new(title, color)
    puts "Label #{title} (#{color}) created successfully!"
  end

  # Option 6:
  def create_genre
    puts 'Input the name for this genre:'
    name = gets.chomp
    @genres << Genre.new(name)
    puts "Genre #{name} succesfully created!"
  end

  # Option 8:
  def create_album
    params_exists?
    genre = select_genre
    author = select_author
    label = select_label
    puts 'When was this album published?'
    publish_date = select_date
    puts 'Is this album on Spotify?'
    on_spotify = select_boolean
    @music_albums << MusicAlbum.new(genre, author, label, publish_date, on_spotify)
    puts "#{genre.name} album from #{author.first_name} succesfully created!"
  end

  # Option 7:
  def create_book
    params_exists?
    genre = select_genre
    author = select_author
    label = select_label
    puts 'When was this book published?'
    publish_date = select_date
    puts 'Insert publisher'
    publisher = gets.chomp
    puts 'How is cover state (good, medium, bad)'
    cover_state = gets.chomp
    @books << Book.new(genre, author, label, publish_date, publisher, cover_state)
    puts "#{genre.name} book from #{author.first_name} succesfully created!"
  end

  # Option 2:
  def list_labels
    puts 'All labels in the app:'
    @labels.each_with_index do |label, index|
      puts "(#{index + 1}) called: #{label.title} (color #{label.color})"
    end
    puts ''
  end

  # Option 3:
  def list_genres
    puts 'All genres in the app:'
    @genres.each_with_index do |genre, index|
      puts "(#{index + 1}) #{genre.name}"
    end
    puts ''
  end

  # Option 4:
  def list_albums
    return puts 'There are no music albums yet' if @music_albums.empty?

    @music_albums.each_with_index do |album, index|
      puts "(#{index}) on #{album.publish_date}, #{album.author.first_name} #{album.author.last_name}"
      puts "created a #{album.genre.name} album which is on spotify(#{album.on_spotify}) now it is #{album.label.title}"
      puts ''
    end
  end

  # option 1:
  def list_books
    return puts 'There are no books yet' if @books.empty?

    @books.each_with_index do |book, index|
      puts "(#{index}) on #{book.publish_date}, #{book.author.first_name} #{book.author.last_name}"
      puts "created a #{book.genre.name} book thanks to #{book.publisher}, now it is #{book.label.title}"
      puts ''
    end
  end

  def list_games
    return puts 'There are no games yet' if @games.empty?

    @games.each_with_index do |game, index|
      puts "(#{index}) on #{game.publish_date}, #{game.author.first_name} #{game.author.last_name}"
      puts "created a #{game.genre.name} game, last played on #{game.last_played_at} (#{game.label.title})"
    end
  end

  def list_authors
    puts 'All authors in the app:'
    @authors.each_with_index do |author, index|
      puts "(#{index + 1}) First Name: #{author.first_name}, Last Name: #{author.last_name}"
    end
  end

  def game_details
    params_exists?
    genre = select_genre
    author = select_author
    label = select_label
    puts 'When was this game published?'
    publish_date = select_date
    puts 'Is this game multiplayer?'
    multiplayer = select_boolean
    puts 'When was this game last played?'
    last_played_at = select_date
    [genre, author, label, publish_date, multiplayer, last_played_at]
  end

  def select_author
    puts 'Select an author from the list:'
    list_authors
    @authors[gets.chomp.to_i - 1]
  end

  def select_genre
    puts 'Select a genre from the list:'
    list_genres
    @genres[gets.chomp.to_i - 1]
  end

  def select_label
    puts 'Select an label from the list:'
    list_labels
    @labels[gets.chomp.to_i - 1]
  end

  def select_date
    puts 'MM/DD/YYYY: '
    gets.chomp
  end

  def select_boolean
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
    puts "#{genre.name} game by #{author.first_name} succesfully created!"
  end

  def create_author
    puts "First Name: \n"
    first_name = gets.chomp
    puts "Last Name: \n"
    last_name = gets.chomp
    @authors << Author.new(first_name, last_name)
    puts "#{first_name} #{last_name} successfully added to the list of authors!"
  end

  def save_data
    File.write('label.json', JSON.generate(@labels))
    File.write('genres.json', JSON.generate(@genres))
    File.write('item.json', JSON.generate(@books))
    File.write('games.json', JSON.generate(@games))
    File.write('authors.json', JSON.generate(@authors))
    File.write('music_albums.json', JSON.generate(@music_albums))
    abort('Thanks for using the app, see you later!')
  end
end
