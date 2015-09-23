require 'spec_helper'
require_relative '../game'

module TicTacToe
  describe Game do

    context "#initialize" do
      it "randomly selects a current_player" do
        allow(Game::Players).to receive(:shuffle).and_return(:X)
 
        game = Game.new
        expect(game.current_player).to eq :X
      end
      
      it "randomly selects a other player" do
        allow(Game::Players).to receive(:shuffle).and_return(:O)
 
        game = Game.new
        expect(game.current_player).to eq :O
      end
      
      context "#switch_players" do
        it "will set @current_player to @other_player" do
          game = Game.new
          other_player = game.other_player
          game.switch_players
          expect(game.current_player).to eq other_player
        end
        
        it "will set @other_player to @current_player" do
          game = Game.new
          current_player = game.current_player
          game.switch_players
          expect(game.other_player).to eq current_player
        end
      end
      
      context "#solicit move" do
        it "asks the player to make a move" do
          game = Game.new
          allow(game).to receive(:current_player){:X}

      
          expected = "X, your turn."
          expect(game.solicit_move).to eq expected
        end
      end
      
      context "#get_move" do
        it "converts human_move of '1' to [0, 0]" do
          game = Game.new
          expect(game.get_move("1")).to eq [0, 0]
        end
        
         it "converts human_move of '7' to [0, 0]" do
          game = Game.new
          expect(game.get_move("7")).to eq [0, 2]
         end

      end
#       
      context "#game_over_message" do
        it "returns '{current player name} won!' if board shows a winner" do
          game = Game.new
          allow(game).to receive(:current_player){:O}
          allow(game.board).to receive(:game_over).and_return(:winner)
          expect(game.game_over_message).to eq "O won!"
        end
#         
        it "returns 'The game ended in a tie' if board shows a draw" do
          game = Game.new
          allow(game.board).to receive(:game_over).and_return(:draw)
          expect(game.game_over_message).to eq "The game ended in a tie"
        end
      end
    end
  end
end


















