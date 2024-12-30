class BoardState
  attr_accessor :winner
  attr_accessor :player
  attr_accessor :state
  def initialize()
    @winner='none'
    @player=-1
    @state=[Square.new('top', 'left'), Square.new('top', 'middle'), Square.new('top', 'right'), Square.new('middle', 'left'), Square.new('middle', 'middle'), Square.new('middle', 'right'), Square.new('bottom', 'left'), Square.new('bottom', 'middle'), Square.new('bottom', 'right')]
  end

  def set_board()
    self.state=[Square.new('top', 'left'), Square.new('top', 'middle'), Square.new('top', 'right'), Square.new('middle', 'left'), Square.new('middle', 'middle'), Square.new('middle', 'right'), Square.new('bottom', 'left'), Square.new('bottom', 'middle'), Square.new('bottom', 'right')]
    self.winner='none'
    self.player=-1
    game_display.display_board()
  end

  def check_move(move)
    self.state[move]==0
  end

  def check_array(arr, num)
    arr.all?{|square| square.value==num} 
  end

  def check_squares(move)
    winner=0
    #takes location on board and returns winner as int value (0 is no winner)
    location=self.state[move]
    rows=self.state.filter{|square| square.row==location.row}
    columns=self.state.filter{|square| square.row==location.row}
    if check_array(rows, location.value)||check_array(columns, location.value)||check_diagonals(move, location.value)
      winner=location.value
    end
    winner
  end

  def check_diagonals(move, num)
    output=false
    if move.odd?
      left=[self.state[1], self.state[5], self.state[9]]
      right=[self.state[3], self.state[5], self.state[7]]
      if check_array(left, num) || check_array(right, num)
        output=true
      end
    end
    output
  end
end
