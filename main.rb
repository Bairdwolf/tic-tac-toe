require_relative 'lib/square'
require_relative 'lib/gamedisplay'
require_relative 'lib/boardstate'

def play_game()
  board=BoardState.new()
  game_display=GameDisplay.new()
  #sets global objects for board and display
  game_display.display_board()
  until board.winner==1 || board.winner==-1
    board.player=-board.player
    choice=make_choice(board.player,board, game_display)
    board.winner=play_move(board.player, choice, board, game_display)
  end
  game_display.bottom_winner(board.winner)
end

def make_choice(player, board, game_display)
  valid_move=false
  choice=0
  until valid_move==true
    choice=ask_input(player, game_display)
    valid_move=board.check_move(choice)
  end
  choice
end

def ask_input(player, game_display)
  game_display.bottom_update(player)
  begin
    puts "Select a number from 1 to 9"
    input=gets.chomp.to_i
  rescue StandardError =>e
    puts "\tError: #{e}"
    retry
  end
  return input-1
end

def play_move(player, choice, board, game_display)
  board.state[choice].value=player
  winner=board.check_squares(choice)
  if winner==0
    game_display.middle_update(choice, board)
  end
  winner
end

play_game()