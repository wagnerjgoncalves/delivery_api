require 'rails_helper'

describe Dijkstra::Graph do
  let(:node_a) { Dijkstra::Node.new("Node A") }
  let(:node_b) { Dijkstra::Node.new("Node B") }
  let(:node_c) { Dijkstra::Node.new("Node C") }
  let(:node_d) { Dijkstra::Node.new("Node D") }

  it { expect(subject.vertexs).to be_empty }
  it { expect(subject.nodes).to be_empty }

  describe "#add_vertex" do
    it "change veterxs by 1" do
      expect {
        subject.add_vertex(Dijkstra::Vertex.new(node_a, node_b, 10))
      }.to change{ subject.vertexs.length }.by(1)
    end
  end

  describe "#adjacent_vertexs" do
    let(:vertex_a_b) { Dijkstra::Vertex.new(node_a, node_b, 10) }
    let(:vertex_b_c) { Dijkstra::Vertex.new(node_b, node_c, 40) }
    let(:vertex_a_c) { Dijkstra::Vertex.new(node_a, node_c, 35) }
    let(:vertex_d_c) { Dijkstra::Vertex.new(node_d, node_c, 15) }

    before do
      subject.add_vertex(vertex_a_b)
      subject.add_vertex(vertex_b_c)
      subject.add_vertex(vertex_a_c)
      subject.add_vertex(vertex_d_c)
    end

    it "return adjacent vertexs from a" do
      expect(subject.adjacent_vertexs(node_a)).to eq [vertex_a_b, vertex_a_c]
    end
  end

  describe "#nodes" do
    before do
      subject.add_vertex(Dijkstra::Vertex.new(node_a, node_b, 10))
      subject.add_vertex(Dijkstra::Vertex.new(node_b, node_c, 20))
      subject.add_vertex(Dijkstra::Vertex.new(node_a, node_c, 40))
      subject.add_vertex(Dijkstra::Vertex.new(node_c, node_d, 5))
    end

    it "return uniq nodes" do
      expect(subject.nodes).to eq [node_a, node_b, node_c, node_d]
    end
  end
end
