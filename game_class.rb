require './item_class'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(genre, author, label, publish_date, multiplayer, last_played_at) # rubocop:disable Metrics/ParameterLists
    super(genre, author, label, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @archived = false
  end

  def can_be_archived?
    now = Date.today.year
    last_played_at = Date.parse(@last_played_at).year

    super() && now - last_played_at >= 2
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'genre' => @genre,
      'author' => @author,
      'label' => @label,
      'publish_date' => @publish_date,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at,
      'archived' => @archived
    }.to_json(*args)
  end
end
