require 'test_helper'

class BarGraphTest < Test::Unit::TestCase

  def setup
    @graph = BarGraph.new [20, 13, 60], :width => 300, :height => 100,
      :position => [50, 50]
  end
  
  def test_converts_points_into_rectangles
    expected = [
      [ 50, 116, 90,  34],
      [175, 128, 90,  22],
      [300,  50, 90, 100]]
      
    assert_equal expected, @graph.bars
  end
  
  def test_calculates_bar_dimensions
    assert_equal 100, @graph.column_distance
    assert_equal  90, @graph.column_width
  end

end