require './music_album'

describe 'MusicAlbum' do
  before :each do
    @album = MusicAlbum.new('Metal', 'Korn', 'New', '09-13-2019', true)
  end

  it 'is an instance of itself' do
    expect(@album).to be_an_instance_of MusicAlbum
  end

  it 'creates an album with the correct parameters' do
    expect(@album.on_spotify).to be_truthy
  end
end
