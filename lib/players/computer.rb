module Players
    class Computer < Player
        
        def move(board)
            [move_corner,move_random].sample
        end
        def move_corner
            a = ["1","3","7","9"].sample
            if @board.valid_move?(a)
                return a 
            else  
                ["1","3","7","9"].find {|s| @board.valid_move?(s)}
            end
        end
        def move_random
            a = 'invalid'
            until @board.valid_move?(a) == true
                a = ["1","2","3","4","5","6","7","8","9"].sample
            end
            a
        end
    end
end