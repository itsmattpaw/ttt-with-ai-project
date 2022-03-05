module Players
    class Human < Player
        def move(board)
            puts "What's the move?"
            input = gets.strip
        end

    end
end