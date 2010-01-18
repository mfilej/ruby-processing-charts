require 'graph'

class LineGraph < Graph
  
  def lines
    @lines ||= (0..data.size - 2).to_a.map do |index|
      first, second = points[index, 2]
      [first[0], first[1], second[0], second[1]]
    end
  end
  
end