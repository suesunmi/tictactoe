module TicTacToe

  class UnbeatablePlayer
    attr_accessor :marker, :board

    def initialize(marker, board)
      @marker = marker
      @board = board
    end

    def make_next_play
      opponent = @board.opponent(@marker)

      choices = Hash.new
      available = @board.empties
      available.each do |position|
        test_board = @board.clone
        test_board.play(position, @marker)
        best = -(best_for(opponent, test_board, -100, 100))
        choices[position] = best
      end
      max = choices.values.max
      @board.play(choices.key(max), @marker)
    end

    def best_for(player, board, alpha, beta)
      opponent = board.opponent(player)
      if board.has_winner
        if board.winner == player
          return 100
        end
        if board.winner == opponent
          return -100
        end
      elsif board.full?
        return 0
      end
      choices = Hash.new
      available = board.empties
      available.each do |position|
        test_board = board.clone
        test_board.play(position, player)
        best = (-(best_for(opponent, test_board, -beta, -alpha))) + available.length
        if best >= beta
          return best
        end
        if best >= alpha
          alpha = best
        end
      end
      return alpha
    end
  end

end
