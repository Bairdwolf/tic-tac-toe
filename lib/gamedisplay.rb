class GameDisplay
  attr_accessor :top
  attr_accessor :middle
  attr_accessor :bottom

  def initialize()
    @@padding= '==============='
    @top=[@@padding, '| TIC TAC TOE |', @@padding]
    @middle=[0, 0, 0, 0, 0, 0, 0, 0, 0]
    @bottom=[@@padding, '| BEGIN  PLAY |', @@padding]
  end

  def self.padding()
    @@padding
  end

  def display_board()
    display_section(self.top)
    display_section(middle_print(self.middle))
    display_section(bottom)
  end

  def display_section(arr)
    arr.each do |line| puts line
    end
  end

  def bottom_update(player)
    num=0
    if player==1
      num=1
    else
      num=2
    end
    self.bottom[1]="|PLAYER #{num} TURN|"
    display_board()
  end

  def bottom_winner(winner)
    num=0
    if winner==1
      num=1
    else
      num=2
    end
    self.bottom[1]="|PLAYER #{num} WINS|"
    display_board()
  end

  def middle_update(location, board)
    self.middle[location]=board.state[location].value
  end

  def middle_print(arr)
    hash={0 => '-', 1 => 'X', -1 => 'O'}
    translated=arr.map{|item| hash[item]}
    empty_pipes= '|             |'
    middle_lines=[three_print(translated[0..2]), empty_pipes, three_print(translated[3..5]), empty_pipes, three_print(translated[6..8])]
    middle_lines
  end

  def three_print(array)
    output= "|  #{array[0]}   #{array[1]}   #{array[2]}  |}"
    output
  end
end
