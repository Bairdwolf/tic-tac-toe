#displays on command line with two human players
#===============
#| TIC TAC TOE |
#===============
#|  X   X   X  |
#|             |
#|  X   X   X  |
#|             |
#|  X   X   X  |
#===============
#|PLAYER 1 WINS|
#===============
#LENGTH OF BOADRD: 15
#PIPE, SPACE, SPACE, X, SPACE, SPACE, SPACEC, X, SPACE, SPACE, SPACE, X, SPACE, SPACE, PIPE
#CLASSES: Square
#subclass: diagonal left, diagonal right
#instance variables: row=top, row=middle, row=bottom
#other instance variables: column=left, column=middle, column=right
#value=empty, value=X, value=O
#play game function: set board(), set and keep track of current player until winner is found play_round(X)
#play_round: ask_input. check move(input). if false, ask_input again. if true, make_move(1, X)
#ask_input: 1 through 9.
#check_move: if square is empty, return true, else return false
#make_move: sets value to X or O, then check_squares(1), then Display.update()
#check_squares(num): checks the values of rows, columns, if odd, check diagonal
#check_diagonal(num): if num==5, check (1, 9) and (3, 7) else check ()
#player 1 is X  or 1
#player 2 is -1 or O
#also add a global boardstate as an object that stores values of things
require_relative 'lib/square'
require_relative 'lib/gamedisplay'
require_relative 'lib/boardstate'
board=BoardState.new()
game_display=GameDisplay.new()
multiple_games=false

def play_game()
  if multiple_games==true
    board.set_board()
  else
    game_display.setup_display()
  end
  until board.winner==1 || board.winner==-1
    board.player=-board.player
    play_turn(board.player)
  end
  #display bottom winner=winner
  game_display.display_board()
end

def play_turn(player)
    
end




