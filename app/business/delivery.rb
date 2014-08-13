class Delivery
  attr_accessor :map, :autonomy, :fuel_cost, :from, :to

  def initialize(options)
    self.map = options.fetch(:map)
    self.autonomy = options.fetch(:autonomy)
    self.fuel_cost = options.fetch(:fuel_cost)
    self.from = options.fetch(:from)
    self.to = options.fetch(:to)
  end

  def calculate
    {
      route: dijkstra.shortest_path,
      cost: calculate_cost
    }
  end

  private

  def calculate_cost
    return 0.0 if fuel_cost.to_f == 0.0 || autonomy.to_i == 0

    (dijkstra.shortest_distance * fuel_cost.to_f)/autonomy.to_i
  end

  def map_instance
    @map_instance ||= Map.find_by(name: map)
  end

  def graph
    @graph ||= DijkstraGraphFactory.create(map_instance)
  end

  def dijkstra
    @dijkstra ||= begin
      node_from = graph.nodes.select { |n| n.name == from }.first
      node_to = graph.nodes.select { |n| n.name == to }.first

      Dijkstra::Dijkstra.new(graph, node_from, node_to)
    end
  end
end
