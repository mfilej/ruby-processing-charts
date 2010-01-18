class Graph
  
  attr_reader :data, :height, :width, :position
  
  def initialize(data = [], options = {})
    @data     = data
    @height   = options[:height]
    @position = options[:position] || [0, 0]
    
    unless @width = options[:width]
      @x_margin   = options[:x_margin] || 30
      @width      = (data.size - 1) * @x_margin
    end
  end
  
  def column_width
    @column_width ||= width / (data.size - 1)
  end
  
  def points
    index = 0
    base_y = height + position[1]
    base_x = position[0]
    @points ||= data.map do |value|
      x = base_x + x_offset(index)
      y = base_y - value.to_f / max * height
      index += 1
      [x.to_i, y.to_i]
    end
  end
  
  def baseline
    y = height + position[1]
    [position[0] - 10, y, position[0] + width + 10, y]
  end
  
  def background_lines
    lns = []
    y = height + position[1]
    x = position[0]
    
    loop do
      y -= 50
      lns << [x, y, x + width, y]
      return lns if y <= position[1]
    end
  end
  
  def max
    @max ||= @data.max
  end
  
  def x_offset(index)
    x_margin * (index)
  end
  
  def x_margin
    @x_margin or width / (data.size - 1)
  end
  
  def column_width
    30
  end
    
end