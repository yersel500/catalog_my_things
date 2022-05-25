require './item_class'
require './book'
require './label'
require './game_class'
require './author_class'
require 'json'

class App
  attr_accessor :labels, :books, :games, :authors

  def initialize
    @labels = []
    @books = []
    @games = []
    @authors = []
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
        new_game['multiplayer'], new_game['last_played_at'], archived: new_game['archived'])
        game.id = new_game['id']
        @games << game
      end
    else
      []
    end
  end

  def load_authors
    if File.exist?('authors.json')
      data = JSON.parse(File.read('authors.json'))
      data.each do |author|
        author = Author.new(author['first_name'], author['last_name'])
        author.id = author['id']
        @authors << author
      end
    else
      []
    end
  end

  def load_data
    load_labels
    load_books
    load_games
    load_authors
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

  def list_games 
    return puts 'There are no games yet' if @games.empty?
    @games.each_with_index { |game, index| puts "#{index + 1}) ID: #{game.id}, Genre: #{game.genre}, Author: #{game.author}, Publish date: #{game.publish_date}, Multiplayer: #{game.multiplayer} Last Played: #{game.last_played_at}" }
  end

  def list_authors
    @authors.each { |author| puts "ID: #{author.id}, First Name: #{author.first_name}, Last Name: #{author.last_name}" }
  end

  def create_game
    puts "Genre: \n"
    genre = gets.chomp
    puts "Author: \n"
    author = gets.chomp
    puts "Select a label from the list: \n"
    list_labels
    label = @labels[gets.chomp.to_i]
    puts "When was this game published? \n"
    puts 'MM/DD/YYYY: '
    publish_date = gets.chomp
    puts "Is this game multiplayer? \n"
    puts 'y/n: '
    case gets.chomp
    when 'y'
      multiplayer = true
    when 'n'
      multiplayer = false
    end
    puts "When was this game last played? \n"
    puts 'MM/DD/YYYY'
    last_played_at = gets.chomp
    @games << Game.new(genre, author, label, publish_date, multiplayer, last_played_at)
    puts "Game by #{author} succesfully created!"
  end

  def save_data
    File.write('label.json', JSON.generate(@labels))
    File.write('item.json', JSON.generate(@books))
    File.write('games.json', JSON.generate(@games))
    File.write('authors.json', JSON.generate(@authors))
  end
end
