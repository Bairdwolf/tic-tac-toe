class GameDisplay
  attr_accessor :top, :middle, :bottom

  def initialize
    @@padding = '==============='
    @top = [@@padding, '| TIC TAC TOE |', @@padding]
    @middle = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    @bottom = [@@padding, '| BEGIN  PLAY |', @@padding]
  end

  def self.padding
    @@padding
  end

  def display_board
    display_section(top)
    display_section(middle_print(middle))
    display_section(bottom)
  end

  def display_section(arr)
    arr.each do |line|
      puts line
    end
  end

  def bottom_update(player)
    num = if player == 1
            1
          else
            2
          end
    bottom[1] = "|PLAYER #{num} TURN|"
    display_board
  end

  def bottom_winner(winner)
    num = if winner == 1
            1
          else
            2
          end
    bottom[1] = "|PLAYER #{num} WINS|"
    display_board
  end

  def middle_update(location, board)
    middle[location] = board.state[location].value
  end

  def middle_print(arr)
    hash = { 0 => '-', 1 => 'X', -1 => 'O' }
    translated = arr.map { |item| hash[item] }
    empty_pipes = '|             |'
    [three_print(translated[0..2]), empty_pipes, three_print(translated[3..5]), empty_pipes,
     three_print(translated[6..8])]
  end

  def three_print(array)
    "|  #{array[0]}   #{array[1]}   #{array[2]}  |}"
  end
end
