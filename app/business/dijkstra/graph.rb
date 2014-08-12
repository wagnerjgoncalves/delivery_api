class Dijkstra::Graph
  attr_accessor :nodes, :vertexs

  def initialize
    @nodes = []
    @vertexs = []
  end

  def add_vertex(vertex)
    vertexs << vertex
  end

  def adjacent_vertexs(node)
    vertexs.select{ |e| e.from == node }
  end

  def nodes
    unless vertexs.empty?
      @nodes = vertexs.collect(&:from) + vertexs.collect(&:to)

      @nodes.uniq!(&:name)
    end

    @nodes
  end
end
