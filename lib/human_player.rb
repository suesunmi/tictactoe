module TicTacToe

  class HumanPlayer
    attr_accessor :name, :marker

    def initialize(marker, board)
      @marker = marker
      @board = board
    end

    def make_next_play
      desired = collect_play
      @board.play(desired, @marker)
    end

    def collect_play
      @io.puts @board.display
      @io.puts "#{@name}, enter the position you would like to play:"
      position = @io.gets.chomp
      until @board.valid?(position)
        @io.puts "Answer must be an empty position 1 through 9"
        position = @io.gets.chomp
      end
      position
    end
  end

end
