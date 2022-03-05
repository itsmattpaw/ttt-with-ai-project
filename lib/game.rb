
class Game
    attr_accessor :board, :player_1, :player_2
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,4,8],
        [2,4,6],
        [0,3,6],
        [1,4,7],
        [2,5,8]
    ]

    def initialize(p1 = Players::Human.new("X"),p2 = Players::Human.new("O"),board = Board.new)
        @player_1 = p1
        @player_2 = p2
        @board = board
    end
    def current_player
        (@board.turn_count + 1).odd? ? @player_1 : @player_2
    end
    def won?
        WIN_COMBINATIONS.each do |combo|
            if @board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X"
                return combo
            elsif @board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"
                return combo
            else
                false
            end
        end
        false
    end
    def draw?
        if !@board.cells.detect{|pos| pos == " "} && won? == false
            return true
        else  
            return false
        end
    end
    def over?
        draw? == true || won? != false ? true : false
    end
    def winner
        if won? != false
            if @board.cells[won?[0]] == "X"
              return "X"
            else
              return "O"
            end
        else
            return nil
        end
    end
    def turn
        a = (current_player.move(@board))
        if @board.valid_move?(a)
            @board.update(a,current_player)
        else  
            puts "no sir"
            turn
        end
    end
    def play 
        until over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end
end