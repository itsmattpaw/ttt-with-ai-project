class Board
    attr_accessor :cells
    
    def initialize
        reset!
    end
    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
        puts "\n ///////// \n"
    end
    def reset!
       @cells = Array.new(9," ")
    end
    def to_index(input)
        input.to_i - 1
    end
    def position(input)
        @cells[to_index(input)]
    end
    def full?
        if @cells.detect{|pos| pos == " "}
            return false
        else
            return true
        end
    end
    def turn_count
        counter = 0
        @cells.each do |cell|
            if cell == "X" || cell == "O"
                counter += 1 
            end
        end
        counter
    end
    def taken?(pos)
        position(pos) != " " ? true : false
    end
    def valid_move?(pos)
        if !taken?(pos) && pos.to_i >= 1 && pos.to_i <= 9
            return true
        else  
            return false
        end
    end
    def update(input, player)
        if valid_move?(input)
            @cells[to_index(input)] = player.token
        end
    end
end