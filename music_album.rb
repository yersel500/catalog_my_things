require './item_class'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(genre, author, label, publish_date, on_spotify)
    super(genre, author, label, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    @publish_date >= 10 && @on_spotify
  end
end
