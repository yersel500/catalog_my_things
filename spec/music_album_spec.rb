require './music_album'

describe 'MusicAlbum' do
  before :each do
    @album = MusicAlbum.new('Metal', 'Korn', 'New', '09/13/2019', true)
  end

  it 'is an instance of itself' do
    expect(@album).to be_an_instance_of MusicAlbum
  end

  it 'creates an album with the correct genre' do
    expect(@album.genre).to eq('Metal')
  end
  it 'creates an album with the correct author' do
    expect(@album.author).to eq('Korn')
  end
  it 'creates an album with the correct label' do
    expect(@album.label).to eq('New')
  end

  it 'creates an album with the correct date' do
    expect(@album.publish_date).to eq('09/13/2019')
  end

  it 'creates an album with the correct spotify parameter' do
    expect(@album.on_spotify).to be_truthy
  end

  it 'can be archived' do
    expect(@album.can_be_archived?).to be_truthy
  end
end
