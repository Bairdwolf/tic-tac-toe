class BoardState
  def initialize()
    @winner='none'
    @player=-1
    @state=[Square.new('top', 'left'), Square.new('top', 'middle'), Square.new('top', 'right'), Square.new('middle', 'left'), Square.new('middle', 'middle'), Square.new('middle', 'right'), Square.new('bottom', 'left'), Square.new('bottom', 'middle'), Square.new('bottom', 'right')]
  end

  def set_board()
    #display bottom insturctions=true
    self.state=[Square.new('top', 'left'), Square.new('top', 'middle'), Square.new('top', 'right'), Square.new('middle', 'left'), Square.new('middle', 'middle'), Square.new('middle', 'right'), Square.new('bottom', 'left'), Square.new('bottom', 'middle'), Square.new('bottom', 'right')]
    self.winner='none'
    self.player=-1
    game_display.setup_display()
    #display bottom clear
  end

end