$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')

require 'line_graph'
require 'demo'

class LineDemo < Processing::App
  include Demo

  def setup
    ellipse_mode CENTER
    super
  end
  
  def graph
    @graph ||= LineGraph.new DATA,
      :width => width - 100, :height => height - 100, :position => [50, 50]
  end
  
  def plot_graph
    stroke 255, 0, 0
    graph.lines.each(&plot_lines)

    no_stroke
    fill 255, 0, 0
    graph.points.each { |(x, y)| ellipse x, y, 3, 3 }
  end

end

LineDemo.new :title => "Charts!", :width => 1000, :height => 300