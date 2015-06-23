require 'rails_helper'

describe Dijkstra::Vertex do
  let(:node_a) { Dijkstra::Node.new("Node A") }
  let(:node_b) { Dijkstra::Node.new("Node B") }

  describe "#to_s" do
    subject { described_class.new(node_a, node_b, 100) }

    it "return nodes names with distance" do
      expect(subject.to_s).to eq "Node A -> Node B: 100"
    end
  end
end
