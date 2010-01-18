require 'graph'

class BarGraph < Graph
  
  attr_reader :column_width, :column_distance
  
  def initialize(data = [], options = {})
    super
    
    @column_distance = width.to_f / data.size
    @column_width = @column_distance * 0.9
  end
  
  def points
    @points ||= begin
      original = super
      (0...original.size).to_a.map do |index|
        original[index][0] -= (column_distance / (data.size + 1)) * index
      end
      original
    end
  end
  
  def bars
    base_y = position[1] + height
    @bars ||= (0...data.size).to_a.map do |index|
      x, y = points[index]
      value = base_y - y
      [x.to_i, y, column_width.to_i, value]
    end
  end
  
end