require './item_class'
require './book'
require './label'
require './music_album'
require './genre'
require 'json'

class App
  attr_accessor :labels, :books, :genres, :music_albums

  def initialize
    @labels = []
    @books = []
    @genres = []
    @music_albums = []
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

  def load_data
    load_labels
    load_genres
    load_books
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
    puts 'y/n: '
    case gets.chomp
    when 'y'
      on_spotify = true
    when 'n'
      on_spotify = false
    end
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

  def save_data
    File.write('label.json', JSON.generate(@labels))
    File.write('genres.json', JSON.generate(@genres))
    File.write('item.json', JSON.generate(@books))
    File.write('music_albums.json', JSON.generate(@music_albums))
  end
end
