require './item_class'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date, archived)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    now = Date.today.year
    last_played_at = @last_played_at.year

    super() && now - last_played_at >= 2
  end
end
