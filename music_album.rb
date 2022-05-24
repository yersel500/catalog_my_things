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

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'genre' => @genre,
      'author' => @author,
      'label' => @label,
      'publish_date' => @publish_date,
      'on_spotify' => @on_spotify
    }.to_json(*args)
  end
end
