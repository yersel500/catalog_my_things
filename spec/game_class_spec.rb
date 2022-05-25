require './game_class'

describe 'Game' do
    before :each do
      @game = Game.new('Shooter', 'Blizzard', 'Gift', '01/01/2005', true, '01/01/2010', archived: false)
    end
  
    it 'is an instance of itself' do
      expect(@game).to be_an_instance_of Game
    end
  
    it 'creates a game with the correct genre' do
      expect(@game.genre).to eq('Shooter')
    end

    it 'creates a game with the correct author' do
        expect(@game.author).to eq('Blizzard')
    end

    it 'creates a game with the correct label' do
        expect(@game.label).to eq('Gift')
    end

    it 'creates a game with the correct publish date' do
        expect(@game.publish_date).to eq('01/01/2005')
    end

    it 'creates a game with the correct multiplayer status' do
        expect(@game.multiplayer).to eq(true)
    end

    it 'creates a game with the correct last played date' do
        expect(@game.last_played_at).to eq('01/01/2010')
    end

    it 'creates a game with the correct archive status' do
        expect(@game.archived).to eq(false)
    end
  end