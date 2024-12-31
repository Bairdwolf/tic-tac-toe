class BoardState
  attr_accessor :winner, :player, :state

  def initialize
    @winner = 'none'
    @player = -1
    @state = [Square.new('top', 'left'), Square.new('top', 'middle'), Square.new('top', 'right'),
              Square.new('middle', 'left'), Square.new('middle', 'middle'), Square.new('middle', 'right'), Square.new('bottom', 'left'), Square.new('bottom', 'middle'), Square.new('bottom', 'right')]
  end

  def check_move(move)
    state[move].value == 0
  end

  def check_array(arr, num)
    arr.all? { |square| square.value == num }
  end

  def check_squares(move)
    winner = 0
    # takes location on board and returns winner as int value (0 is no winner)
    location = state[move]
    rows = state.filter { |square| square.row == location.row }
    columns = state.filter { |square| square.column == location.column }
    if check_array(rows,
                   location.value) || check_array(columns, location.value) || check_diagonals(move, location.value)
      winner = location.value
    end
    winner
  end

  def check_diagonals(move, num)
    output = false
    if (move + 1).odd?
      left = [state[0], state[4], state[8]]
      right = [state[2], state[4], state[6]]
      output = true if check_array(left, num) || check_array(right, num)
    end
    output
  end
end
