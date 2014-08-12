class Dijkstra::Node
  attr_accessor :name

  def initialize(name)
    self.name = name
  end

  def to_s
    name
  end
end
