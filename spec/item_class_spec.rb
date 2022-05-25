require './item_class'

describe 'Item' do
  before :each do
    @item = Item.new('rock', 'Joaquin', 'New', '01-01-2000')
  end

  it 'should be an instance of itself' do
    expect(@item).to be_an_instance_of Item
  end

  it 'should return the correct genre' do
    expect(@item.genre).to eq('rock')
  end

  it 'should return the correct author' do
    expect(@item.author).to eq('Joaquin')
  end

  it 'should return the correct label' do
    expect(@item.label).to eq('New')
  end

  it 'should return the correct publish date' do
    expect(@item.publish_date).to eq('01-01-2000')
  end

  it 'returns the correct boolean for can be archived method' do
    expect(@item.can_be_archived?).to be true
  end

  it 'returns the correct boolean for the move to archive method' do
    @item.move_to_archive
    expect(@item.archived).to be true
  end
end
