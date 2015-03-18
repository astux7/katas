require 'board'

describe 'Board' do
  let(:board) { Board.new }

  it 'has 16 cell grid' do
    expect(board.grid.count).to eq(16)
  end

  context 'checks the move of player' do

  end

  it 'checks game_over' do
    expect(board.game_over?).to be_falsy
  end
end