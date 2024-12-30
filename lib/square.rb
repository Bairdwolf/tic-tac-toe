class Square
  attr_accessor :row
  attr_accessor :column
  attr_accessor :value
  def initialize(row, column)
    @row=row
    @column=column
    @value=0
  end
end