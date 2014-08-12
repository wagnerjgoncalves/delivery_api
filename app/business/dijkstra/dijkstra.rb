class Dijkstra::Dijkstra
  attr_accessor :graph, :from, :to

  def initialize(graph, from, to)
    self.graph = graph
    self.from = from
    self.to = to

    compute_nodes_distances
  end

  def shortest_path
    path = []
    node = to

    while node != from && node.present?
      path.unshift(node)

      node = path_to[node]
    end

    path.unshift(from).join(" -> ")
  end

  def shortest_distance
    distances.each_pair do |key, value|
      return value if key == to
    end

    0
  end

  private

  def initialize_nodes_distances
    graph.nodes.each do |node|
      distances[node] = Float::INFINITY
    end

    distances[from] = 0
  end

  def compute_nodes_distances
    initialize_nodes_distances

    queue[from] = 0

    while queue.any?
      node = queue.shift.first

      graph.adjacent_vertexs(node).each do |vertex|
        calculate_better_distance(vertex)
      end
    end
  end

  def calculate_better_distance(vertex)
    shortest_distance = distances[vertex.from] + vertex.distance

    return if distances[vertex.to] <= shortest_distance

    distances[vertex.to] = shortest_distance
    path_to[vertex.to] = vertex.from
    queue[vertex.to] = shortest_distance
  end

  def distances
    @distances ||= {}
  end

  def queue
    @queue ||= {}
  end

  def path_to
    @path_to ||= {}
  end
end
