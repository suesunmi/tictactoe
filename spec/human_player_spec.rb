require 'human_player'
require 'board'

describe TicTacToe::HumanPlayer do

  it "instantiates" do
    @board = TicTacToe::Board.new
    @player = TicTacToe::HumanPlayer.new("X", @board)
    @player.object_id != nil
  end
end
