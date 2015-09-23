require_relative 'core_extensions'

module TicTacToe
  class Board
    
    BoardSize = 3 
    
    attr_reader :grid
    def initialize input = {}
      @grid = input.fetch(:grid, default_grid)
    end
    
    def get_cell x, y
      @grid[y][x]
    end
#     
    #set a step for the player before checking if the step is valid:
    #the step is inside the board and the cell has not been taken
    def set_cell x, y, player
      inside_board?(x, y) && get_cell(x, y) == "" && @grid[y][x] = player      
    end
    
    def game_over
      return :winner if winner?
      return :draw if draw?
      return false
    end
    
    def formatted_grid
      @grid = default_grid
    end
    
    private
    
    def default_grid
      Array.new(BoardSize){ Array.new(BoardSize, "") }
    end
    
    def inside_board?(x, y)
      (0...BoardSize).include?(x) && (0...BoardSize).include?(y)
    end
    
    
    #check if all of the possible positions with X or O
    def winner?
      winning_positions.each do |winning_position|
        next if winning_position.all_empty?
        return true if winning_position.all_same?
      end
      return false #has to be return false, once we use return somewhere else
    end
    
    #there are 8 possible winning positions in tic-tac-toe: 3 rows, 3 cols and 2 diagonals. 
    def winning_positions
      @grid + #rows
      @grid.transpose + #columns
      diagonals #2 diagonals
    end
    
    def diagonals
      [
        [get_cell(0, 0), get_cell(1,1), get_cell(2, 2)], 
        [get_cell(0, 2), get_cell(1,1), get_cell(2, 0)]
      ]
    end
    
    def draw?
      @grid.flatten.none_empty?
    end
  end
end























