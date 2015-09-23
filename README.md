Tic-Tac-Toe
================

This application is to build the famous tic-tac-toe game. The board is a 3 X 3 grid and players alternate 
turns until one player is victorious or the game ends in a draw. Players win by securing three consecutive 
positions on a row, column, or diagonal. The game ends in a tie if neither player 
has won and all positions on the board are taken.



###Installing

Ensure you have Git and Ruby 2.2.2 installed. Optionally, install rbenv to manage Ruby versions, and editorconfig for 
automatic editor configuration.

Then, in a console execute:

	git clone git@github.com:judywu29/tic_tac_toe.git
	cd tic_tac_toe
	gem install bundler
	bundle install

###Supported operating systems

tic-tac-toe should install on pretty much any recent Linux or OSX operating system. 
	
###Running

Interactively:

	$ ruby tic_tac_toe.rb
	Welcome to tic tac toe
	X has randomly been selected as the first player
	pls enter a number between 1 and 9 to make your move
	1
	O, your turn. 
	6
	X, your turn. 
	2
	O, your turn. 
	7
	X, your turn. 
	3
	X won!
	
	
With invalid commands:

 	$ ruby tic_tac_toe.rb
	Welcome to tic tac toe
	X has randomly been selected as the first player
	pls enter a number between 1 and 9 to make your move
	a
	Ignoring this invalid step, pls try again.
	10
	Ignoring this invalid step, pls try again.
	abc
	Ignoring this invalid step, pls try again.
 	 1 
	Ignoring this invalid step, pls try again.
	1
	O, your turn.

###Development notes

I made the following assumptions for the std input: 

- Lines that are either empty or contain only whitespace can be completely ignored 
- Whitespace in line is invalid

I assume the grid is an Array with three nested Arrays, each with three elements.

The nested array data structure closely mirrors an actual tic-tac-toe board:

example_array = [
  ["X", "O", "X"],
  ["O", "O", " "],
  ["X", "O", "1"]
]
A nested data structure also provides a convenient coordinate system to access elements of the array. 
Coordinate systems are usually stated in (x, y) and have an origin in the lower left corner. 
The nested array coordinate system has an origin in the upper left corner and is stated in (y, x). 
To access the “1” element in the example_array above, we use this code: example_array[2][2]. 
Make sure to play with the nested array structure in your console until you understand it.

The Game class is responsible for creating a message that can be printed on the command line and 
ask the current_player to make a move. The human move will be a number from 1 to 9 that corresponds 
with a cell on the grid.
I used a mapping like this to simplify the move for the users:
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


Depending upon the time available and the background of the intended users, some of those assumptions 
could easily be challenged. E.g. Windows users are not used to case sensitivity or silent success.


###Contact

Judy Wu, judy.wu29@gmail.com