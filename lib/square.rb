class Square
  attr_accessor :row, :column, :value

  def initialize(row, column)
    @row = row
    @column = column
    @value = 0
  end
end
