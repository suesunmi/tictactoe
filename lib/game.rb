require 'board'
require 'human_player'
require 'unbeatable_player'

module TicTacToe

  class Game
    def whats_next(preference, string_board, position)
      @board = TicTacToe::Board.new(string_board)
      if string_board == "_________" && preference == "2"
        player_a = TicTacToe::HumanPlayer.new("X", @board)
        @board.play(position, player_a.marker)
      else
        @board.play(position, next_player(string_board))
      end
      if evaluate == :continue && preference == "1"
        player_a = TicTacToe::UnbeatablePlayer.new("X", @board)
        player_a.make_next_play
      end
      evaluate
    end

    def next_player(string_board)
      return "" if string_board == "" || string_board == nil
      exes = string_board.delete("_O")
      ohs = string_board.delete("_X")
      next_marker = [exes,ohs].min { |a,b| a.length <=> b.length }
      if next_marker == ohs
        "O"
      elsif next_marker == exes
        "X"
      end
    end

    def evaluate
      if @board.has_winner
        :winner
      elsif @board.full?
        :scratch
      else
        :continue
      end
    end

    def board
      @board.to_s
    end

    def winner
      @board.winner
    end
  end

end
