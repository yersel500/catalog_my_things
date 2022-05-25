require_relative '../book'

describe Book do
  before(:each) do
    @book = Book.new('finance', 'Robert', 'Gift', '01-01-2020', 'mcgrill', 'good')
  end
  it 'Verify the genre of book' do
    expect(@book.genre).to eq('finance')
  end

  it 'Verify the author of book' do
    expect(@book.author).to eq('Robert')
  end

  it 'Verify the label of book' do
    expect(@book.label).to eq('Gift')
  end

  it 'Verify the publish date of book' do
    expect(@book.publish_date).to eq('01-01-2020')
  end

  it 'Verify the publisher of book' do
    expect(@book.publisher).to eq('mcgrill')
  end

  it 'Verify the cover state of book' do
    expect(@book.cover_state).to eq('good')
  end

  it "The book can't be archive because is a new
      (less than 10 years since his publication) and good cover state" do
    expect(@book.can_be_archived?).to be false
  end
end
