require_relative 'board'

module TicTacToe
  class Game
    
    Players = [:X, :O]
    attr_reader :board, :current_player, :other_player
    def initialize(board = Board.new)
      @board = board
      @current_player, @other_player = Players.shuffle
    end
    
    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end
    
    def solicit_move
      "#{current_player.to_s}, your turn."
    end
    
    def game_over_message
      return "#{current_player.to_s} won!" if board.game_over == :winner
      return "The game ended in a tie" if board.game_over == :draw
    end
    
    #The play method is difficult to test due to its procedural nature and reliance on the console. 
    #The best way to test this method is write a script that will execute the game and play it!
    def play
      
      puts "#{current_player.to_s} has randomly been selected as the first player"
      puts "pls enter a number between 1 and 9 to make your move"

      board.formatted_grid
      
      invalid_stdout = "Ignoring this invalid step, pls try again."
      while human_move = gets.chomp
        valid_step = false
        if human_move =~ /\d/
          x, y = human_move_to_coordinate(human_move)
          valid_step = board.set_cell(x, y, current_player)
        end
        unless valid_step  
          puts invalid_stdout
          next
        end

        if board.game_over
          puts game_over_message
          # board.formatted_grid
          return
        else
           switch_players
           puts solicit_move
        end
      end
    end
    
    
    private
    def human_move_to_coordinate(human_move)
      mapping = {
        "1" => [0, 0], 
        "2" => [1, 0], 
        "3" => [2, 0], 
        "4" => [0, 1], 
        "5" => [1, 1], 
        "6" => [2, 1], 
        "7" => [0, 2], 
        "8" => [1, 2], 
        "9" => [2, 2]
      }
      mapping[human_move]
    end
  end
end