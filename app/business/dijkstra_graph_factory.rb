class DijkstraGraphFactory
  def self.create(map)
    graph = Dijkstra::Graph.new
    nodes = nodes(map.map_routes)

    map.map_routes.each do |map_route|
      graph.add_vertex(
        Dijkstra::Vertex.new(
          nodes[map_route.from],
          nodes[map_route.to],
          map_route.distance
        )
      )
    end

    graph
  end

  def self.nodes(map_routes)
    nodes = {}

    nodes_names = (map_routes.collect(&:from) + map_routes.collect(&:to)).uniq

    nodes_names.each do |node_name|
      nodes[node_name] = Dijkstra::Node.new(node_name)
    end

    nodes
  end
end
