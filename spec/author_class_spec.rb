require './author_class'
require './book'

describe 'Author' do
  before :each do
    @author = Author.new('Stephen', 'King')
  end

  it 'is an instance of itself' do
    expect(@author).to be_an_instance_of Author
  end

  it 'creates an album with the correct last name' do
    expect(@author.last_name).to eq('King')
  end

  it 'creates an album with the correct first name' do
    expect(@author.first_name).to eq('Stephen')
  end

  it 'Verify add_item method from author' do
    book = Book.new('finance', @author, 'New', '2022', 'mcgrill', 'bad')
    my_author = Author.new('Yersel', 'Hurtado')
    my_author.add_item(book)
    expect(my_author.items[0]).to eq(book)
  end
end
