require './genre'

describe 'Genre' do
  before :each do
    @genre = Genre.new('Metal')
  end

  it 'is an instance of itself' do
    expect(@genre).to be_an_instance_of Genre
  end

  it 'creates a genre with the correct parameters' do
    expect(@genre.name).to eq('Metal')
  end
end
