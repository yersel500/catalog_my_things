require_relative '../label'
require_relative '../book'

describe Label do
  before(:each) do
    @label = Label.new('Gift', 'blue')
  end
  it 'Verify the title of Label' do
    title = 'Gift'
    expect(@label.title).to eq(title)
  end

  it 'Verify the color if the Label' do
    color = 'blue'
    expect(@label.color).to eq(color)
  end

  it 'Verify add_item method from Label' do
    book = Book.new('finance', 'Robert', @label, '2022', 'mcgrill', 'bad')
    my_label = Label.new('Gift', 'blue')
    my_label.add_item(book)
    expect(my_label.items[0]).to eq(book)
  end
end
