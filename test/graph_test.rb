require 'test_helper'

class GraphTest < Test::Unit::TestCase
  
  def setup
    @graph = Graph.new [20, 13, 60], :width => 300, :height => 100
  end
  
  def test_accepts_data
    assert_equal [20, 13, 60], @graph.data
  end
  
  def test_accepts_dimensions
    assert_equal 300, @graph.width
    assert_equal 100, @graph.height
  end
  
  def test_accepts_x_margin_when_width_not_given
    graph = Graph.new [], :x_margin => 100
    assert_equal 100, graph.x_margin
  end
    
  def test_calculated_x_margin_overrides_given_when_width_specified
    assert_equal 20, Graph.new([1, 2, 3], :width => 40, :x_margin => 666).x_margin
  end
  
  def test_has_x_margin
    assert_equal 150, @graph.x_margin
  end
  
  def test_has_default_position
    assert_equal [0, 0], Graph.new([]).position
  end
  
  def test_translates_data_to_points
    assert_equal [[0, 66], [150, 78], [300, 0]], @graph.points
  end
  
  def test_offsets_points_according_to_given_position
    @graph.instance_eval { @position = [20, 20] }
    assert_equal [[20, 86], [170, 98], [320, 20]], @graph.points
  end
  
  def test_gives_graph_baseline
    @graph.instance_eval { @position = [100, 100] }
    assert_equal [90, 200, 410, 200], @graph.baseline
  end
  
  def test_gives_background_lines
    expected = [
      [100, 150, 400, 150],
      [100, 100, 400, 100]]
      
    @graph.instance_eval { @position = [100, 100] }
    assert_equal expected, @graph.background_lines
  end
  
end