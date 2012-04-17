module TicTacToe

  class Board
    attr_accessor :plays, :winner

    WINNING_COMBOS = [
      [1,2,3],
      [4,5,6],
      [7,8,9],
      [1,4,7],
      [2,5,8],
      [3,6,9],
      [1,5,9],
      [3,5,7]
    ]

    def initialize(*args)
      string_board = args[0]
      if args.empty? || string_board == "" || string_board == nil
        @plays = Hash[ 1, "", 2, "", 3, "", 4, "", 5, "", 6, "", 7, "", 8, "", 9, ""]
      else
        @plays = Hash.new
        (1..9).each do |position|
          @plays[position] = extract_marker(position, string_board)
        end
      end
    end

    def extract_marker(position, string_board)
      if string_board[position-1] == "_"
        ""
      else
        string_board[position-1]
      end
    end

    def clone
      clone = Board.new
      @plays.each do |pos, player|
        clone.plays[pos] = player
      end
      clone
    end

    def to_s
      output = ""
      @plays.each do |position, player|
        if player == ""
          output << "_"
        else
          output << player
        end
      end
      output
    end

    def mark_at(position)
      @plays[position]
    end

    def full?
      full = true
      (1..9).each do |position| 
        full = false if @plays[position] == ""
      end
      full
    end

    def play(position, who)
      return if position == ""
      if position.is_a?(String)
        position = position.to_i
      end
      @plays[position] = who
    end

    def has_winner
      set_winner
      return @winner != nil
    end

    def set_winner
      WINNING_COMBOS.each do |combo|
        a = mark_at(combo[0])
        b = mark_at(combo[1])
        c = mark_at(combo[2])
        if a != "" && a == b && b == c
          @winner = a
        end
      end
    end

    def valid?(position)
      if position.is_a?(String)
        position = position.to_i
      end
      mark_at(position) == "" && (1..9).include?(position)
    end 

    def empties
      empties = @plays.select { |position, player| player == "" }
      empties = empties.keys
    end

    def opponent(who)
      opponent = @plays.select { |key,value| value != who && value != "" }
      opponent.values[0]
    end

  end

end
