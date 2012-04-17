require 'game'

describe TicTacToe::Game do
  before(:each) do
    @game = TicTacToe::Game.new
  end
  it "returns the first board in 1-player game" do
    preference = "1"
    board = ""
    position = ""
    @game.whats_next(preference, board, position).should == :continue
    @game.board.should == "X________"
  end

  it "returns the first board in a 2-player @game" do
    preference = "2"
    board = ""
    position = ""
    @game.whats_next(preference, board, position).should == :continue
    @game.board.should == "_________"
  end

  it "returns the second board in a 2-player @game" do
    preference = "2"
    board = "_________"
    position = "1"
    @game.whats_next(preference, board, position).should == :continue
    @game.board.should == "X________"
  end

  it "evaluates a scratch game" do
    preference = "2"
    board = "OXOOXXXO_"
    position = "9"
    @game.whats_next(preference, board, position).should == :scratch
    @game.board.should == "OXOOXXXOX"
    @game.winner.should be_nil
  end

  it "evaluates a winning game" do
    preference = "2"
    board = "OOXOXX___"
    position = "9"
    @game.whats_next(preference, board, position).should == :winner
    @game.board.should == "OOXOXX__X"
    @game.winner.should == "X"
  end
end
