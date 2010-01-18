$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')

require 'bar_graph'
require 'demo'

class BarDemo < Processing::App
  include Demo

  def graph
    @graph ||= BarGraph.new DATA,
      :width => width - 100, :height => height - 100, :position => [50, 50]
  end
  
  def plot_graph
    stroke 1
    fill 0, 0, 0, 200
    graph.bars.each { |bar| rect *bar}  end
end

BarDemo.new :title => "Charts!", :width => 1000, :height => 300