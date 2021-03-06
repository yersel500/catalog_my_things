require './item_class'
require 'json'

class Book < Item
  attr_reader :publisher, :cover_state

  def initialize(genre, author, label, publish_date, publisher, cover_state) # rubocop:disable Metrics/ParameterLists
    super(genre, author, label, publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super() || @cover_state == 'bad'
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'genre' => @genre,
      'author' => @author,
      'label' => @label,
      'publish_date' => @publish_date,
      'publisher' => @publisher,
      'cover_state' => @cover_state
    }.to_json(*args)
  end
end
