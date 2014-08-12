class Dijkstra::Vertex
  attr_accessor :from, :to, :distance

  def initialize(from, to, distance)
    self.from = from
    self.to = to
    self.distance = distance
  end

  def to_s
    "#{from.to_s} -> #{to.to_s}: #{distance}"
  end
end
