require 'spec_helper'
require_relative '../board'
require 'rspec/collection_matchers'

module TicTacToe
  describe Board do
    
    context "#initialize" do
      
      it "initializes the board with a grid" do
        expect{ Board.new(grid:"grid") }.to_not raise_error
      end
      
      it "sets the grid with three rows by default" do
        board = Board.new
        expect(board.grid).to have(3).items
      end
      
      it "creates the three things in each row by default" do
        board = Board.new
        board.grid.each do |row|
          expect(row).to have(3).items
        end
      end
      
      context "#grid" do
        it "returns the grid" do
          board = Board.new(grid: "blah")
          expect(board.grid).to eq "blah"
        end
      end
      
      context "#get_cell" do
        it "returns the cell based on teh (x, y) coordinate" do
          grid = [["", "", ""], ["", "", "something"], ["", "", ""]]
          board = Board.new(grid: grid)
          expect(board.get_cell(2, 1)).to eq "something"
        end
      end
      
      context "#set_cell" do
        it "updates the value of the cell object at a (x, y) coordinate" do
          grid = [["", "", ""], ["", "", ""], ["", "", ""]]
          board = Board.new(grid: grid)
          board.set_cell(0, 0, :O)
          expect(board.get_cell(0, 0)).to eq :O
        end
        
        it "ignores the invalid step because the place has been taken" do
          grid = [[:X, "", ""], ["", "", ""], ["", "", ""]]
          board = Board.new(grid: grid)
          expect(board.set_cell(0, 0, :O)).not_to be true
        end
        
        it "ignores the invalid step because the place is outside board" do
          grid = [[:X, "", ""], ["", "", ""], ["", "", ""]]
          board = Board.new(grid: grid)
          expect(board.set_cell(4, 4, :O)).not_to be true
        end
        
      end
      
#       
      context "#game_over" do
        it "returns :winner if winner? is true" do
          board = Board.new
          allow(board).to receive(:winner?) { true }
          expect(board.game_over).to eq :winner
   
        end
#         
        it "returns :draw if winner? is false and draw? is true" do
          board = Board.new
          allow(board).to receive(:winner?) { false }
          allow(board).to receive(:draw?) { true }
          expect(board.game_over).to eq :draw
   
        end
        
        it "returns false if winner? is false and draw? is false" do
          board = Board.new
          allow(board).to receive(:winner?) { false }
          allow(board).to receive(:draw?) { false }
          expect(board.game_over).to be false
   
        end
#         
        it "returns :winner when row has objects with values that are all the same" do
          grid = [
            [:X, :X, :X], 
            [:O, :X, :O],
            [:O, :O, ""]
          ]
          board = Board.new(grid: grid)
          expect(board.game_over).to eq :winner
        end
#         
        it "returns :draw when all spaces on the board are taken" do
          grid = [
            [:X, :O, :X], 
            [:O, :X, :O],
            [:O, :X, :O]
          ]
          
          board = Board.new(grid: grid)
          expect(board.game_over).to eq :draw
        end
#         
        it "returns false when there's no winner or draw" do
          grid = [
            [:X, "", ""], 
            [:O, "", ""],
            [:O, "", ""]
          ]
          board = Board.new(grid: grid)
          expect(board.game_over).to be false
        end
#         
      end
#       
    end
    
  end
end












