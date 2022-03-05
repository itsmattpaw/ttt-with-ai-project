
class Player  
    attr_reader :token, :board, :game

    def initialize(token)
        @token = token
    end
    def board=(board)
        @board = board
    end
    def game=(game)
        @game = game
    end

end