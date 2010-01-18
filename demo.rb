$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')

module Demo

  DATA = (1..20).to_a.map { rand(100) }

  def setup
    background 255, 255, 255
    smooth
    no_loop
  end
  
  def draw
    plot_background
    plot_graph
    print_labels
  end

  def plot_graph
    # implement when subclassing
  end

  def graph
    # implement when subclassing
  end
  
  def plot_lines
    lambda { |current_line| line *current_line }
  end
  
  def plot_background
    stroke 0.6
    line *graph.baseline
    stroke 0.2
    graph.background_lines.each(&plot_lines)
  end
  
  def stroke(*args)
    if args.size == 1
      super(0, 0, 0, (255 * args.first).to_i)
    else
      super
    end
  end

  def print_labels
    fill 100, 100, 100
    text_align Processing::App::CENTER
    text_font load_font("LucidaSans-12.vlw")
    graph.points.each_with_index do |(x,y), i|
      y -= 12
      label = graph.data[i].to_s
      text(label, x, y, graph.column_width, 20)
    end
  end

end