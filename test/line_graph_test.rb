require 'test_helper'

class LineGraphTest < Test::Unit::TestCase

  def setup
    @graph = LineGraph.new [20, 13, 60], :width => 300, :height => 100
  end
  
  def test_links_points_into_lines
    assert_equal [  0, 66, 150, 78], @graph.lines[0]
    assert_equal [150, 78, 300,  0], @graph.lines[1]
  end

end