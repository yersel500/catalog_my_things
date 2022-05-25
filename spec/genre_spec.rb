require './genre'
require './book'

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

  it 'Verify add_item method from genre' do
    book = Book.new(@genre, 'Yersel', 'New', '2022', 'mcgrill', 'bad')
    my_genre = Genre.new('finance')
    my_genre.add_item(book)
    expect(my_genre.items[0]).to eq(book)
  end
end
