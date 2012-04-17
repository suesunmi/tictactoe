require 'board'

describe TicTacToe::Board do
  context "Board Creation and Inspection" do
    it "initializes with no argument" do
      board = TicTacToe::Board.new
      (1..9).each do | position |
        board.mark_at(position).should == ""
      end
    end

    it "initializes with empty string" do
      board = TicTacToe::Board.new("")
      (1..9).each do | position |
        board.mark_at(position).should == ""
      end
    end

    it "initializes with 'X_O_X_O_X'" do
      board = TicTacToe::Board.new("X_O_X_O_X")
      board.mark_at(1).should == "X"
      board.mark_at(2).should == ""
      board.mark_at(3).should == "O"
      board.mark_at(4).should == ""
      board.mark_at(5).should == "X"
      board.mark_at(6).should == ""
      board.mark_at(7).should == "O"
      board.mark_at(8).should == ""
      board.mark_at(9).should == "X"
    end

    it "returns string of plays" do
      board = TicTacToe::Board.new
      board.play(7, "X")
      board.play(9, "O")
      board.to_s.should == "______X_O"
    end

    it "clones an existing board" do
      board = TicTacToe::Board.new
      board.play(5, "a")
      board.play(6, "b")
      another_board = board.clone
      another_board.mark_at(5).should == "a"
      another_board.mark_at(6).should == "b"
      another_board.mark_at(1).should == ""
      another_board.mark_at(2).should == ""
      another_board.mark_at(3).should == ""
      another_board.mark_at(4).should == ""
      another_board.mark_at(7).should == ""
      another_board.mark_at(8).should == ""
      another_board.mark_at(9).should == ""
      another_board.play(8, "a")
      another_board.play(9, "b")
      board.mark_at(5).should == "a"
      board.mark_at(6).should == "b"
      board.mark_at(1).should == ""
      board.mark_at(2).should == ""
      board.mark_at(3).should == ""
      board.mark_at(4).should == ""
      board.mark_at(7).should == ""
      board.mark_at(8).should == ""
      board.mark_at(9).should == ""
      board.object_id != another_board.object_id
    end
  end

  context "Board Play" do
    before(:each) do
      @board = TicTacToe::Board.new
    end

    it "knows it's not full with after just 3 plays" do
      @board.play(2, "a")
      @board.play(5, "b")
      @board.play(7, "a")
      @board.should_not be_full
    end

    it "knows when there is a winner" do
      @board.play(1, "a")
      @board.play(6, "b")
      @board.play(2, "a")
      @board.play(7, "b")
      @board.play(3, "a")
      @board.has_winner.should == true
    end

    it "records plays properly" do
      @board.play(1, "a")
      @board.play(6, "b")
      @board.play(2, "a")
      @board.mark_at(1).should == "a"
      @board.mark_at(6).should == "b"
      @board.mark_at(2).should == "a"
    end

    it "validates plays" do
      @board.play(3, "a")
      @board.play(4, "b")
      @board.play(8, "a")
      @board.valid?(4).should be_false
      @board.valid?("x").should be_false
    end

    it "converts string to integer" do
      @board.play("9", "a")
      @board.mark_at(9).should == "a"
    end

    it "handles empty string play" do
      @board.play("9", "")
      @board.mark_at(9).should == ""
    end

    it "returns array of available positions" do
      @board.play(1, "x")
      @board.play(2, "x")
      @board.play(3, "x")
      @board.play(4, "x")
      @board.empties.should == [5,6,7,8,9]
      @board.mark_at(5).should == ""
      @board.mark_at(6).should == ""
      @board.mark_at(7).should == ""
      @board.mark_at(8).should == ""
      @board.mark_at(9).should == ""
    end

    it "identifies the opponent" do
      @board.play(5, "o")
      @board.play(6, "x")
      @board.play(7, "o")
      @board.play(8, "x")
      @board.opponent("o").should == "x"
    end

    it "clones an existing board" do
      @board.play(5, "a")
      @board.play(6, "b")
      another_board = @board.clone
      another_board.mark_at(5).should == "a"
      another_board.mark_at(6).should == "b"
      another_board.mark_at(1).should == ""
      another_board.mark_at(2).should == ""
      another_board.mark_at(3).should == ""
      another_board.mark_at(4).should == ""
      another_board.mark_at(7).should == ""
      another_board.mark_at(8).should == ""
      another_board.mark_at(9).should == ""
      @board.mark_at(5).should == "a"
      @board.mark_at(6).should == "b"
      @board.mark_at(1).should == ""
      @board.mark_at(2).should == ""
      @board.mark_at(3).should == ""
      @board.mark_at(4).should == ""
      @board.mark_at(7).should == ""
      @board.mark_at(8).should == ""
      @board.mark_at(9).should == ""
      @board.object_id != another_board.object_id
    end
  end
end
