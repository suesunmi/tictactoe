require 'unbeatable_player'
require 'board'

describe TicTacToe::UnbeatablePlayer do
  before(:each) do
    @board = TicTacToe::Board.new
  end

  it "blocks opponent's win with 3 plays left" do
#1: X   |   2: O   |   3: X
#4:     |   5: O   |   6: X
#7:     |   8:     |   9: O
    player = TicTacToe::UnbeatablePlayer.new("x", @board)
    @board.play(3, "x")
    @board.play(5, "o")
    @board.play(1, "x")
    @board.play(2, "o")
    @board.play(6, "x")
    @board.play(9, "o")
    player.make_next_play
    @board.mark_at(8).should == "x"
  end

  it "blocks opponent's win with 3 plays left II" do
# 1: X   |   2: O   |   3:
# 4: O   |   5: O   |   6: X
# 7: X   |   8:     |   9:
    player = TicTacToe::UnbeatablePlayer.new("x", @board)
    @board.play(1, "x")
    @board.play(6, "x")
    @board.play(7, "x")
    @board.play(2, "o")
    @board.play(4, "o")
    @board.play(5, "o")
    player.make_next_play
    @board.mark_at(8).should == "x"
  end

  it "blocks the opponent's win with 3 plays left III" do
#1: X   |   2: O   |   3: X
#4: O   |   5: O   |   6:
#7:     |   8: X   |   9:
    player = TicTacToe::UnbeatablePlayer.new("x", @board)
    @board.play(1, "x")
    @board.play(2, "o")
    @board.play(3, "x")
    @board.play(4, "o")
    @board.play(5, "o")
    @board.play(8, "x")
    player.make_next_play
    @board.mark_at(6).should == "x"
  end

  it "chooses to win with 3 plays left" do
    player = TicTacToe::UnbeatablePlayer.new("x", @board)
    @board.play(1, "x")
    @board.play(7, "x")
    @board.play(9, "x")
    @board.play(3, "o")
    @board.play(4, "o")
    @board.play(5, "o")
    player.make_next_play
    @board.mark_at(8).should == "x"
  end

  it "blocks opponent from winning with 5 plays left" do
    player = TicTacToe::UnbeatablePlayer.new("x", @board)
    @board.play(5, "x")
    @board.play(3, "o")
    @board.play(8, "x")
    @board.play(2, "o")
    player.make_next_play
    @board.mark_at(1).should == "x"
  end

  it "blocks opponent from winning with 6 plays left" do
    player = TicTacToe::UnbeatablePlayer.new("o", @board)
    @board.play(1, "x")
    @board.play(3, "o")
    @board.play(7, "x")
    player.make_next_play
    @board.mark_at(4).should == "o"
  end

  it "choose to win rather than block the opponent" do
    player = TicTacToe::UnbeatablePlayer.new("x", @board)
    @board.play(1, "x")
    @board.play(2, "o")
    @board.play(4, "x")
    @board.play(5, "o")
    player.make_next_play
    @board.mark_at(7).should == "x"
  end
end
