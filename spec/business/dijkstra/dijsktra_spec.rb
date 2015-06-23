require 'rails_helper'

describe Dijkstra::Dijkstra do
  let(:node_a) { Dijkstra::Node.new("A") }
  let(:node_b) { Dijkstra::Node.new("B") }
  let(:node_c) { Dijkstra::Node.new("C") }
  let(:node_d) { Dijkstra::Node.new("D") }
  let(:node_e) { Dijkstra::Node.new("E") }
  let(:node_f) { Dijkstra::Node.new("F") }

  let(:vertex_a_b) { Dijkstra::Vertex.new(node_a, node_b, 10) }
  let(:vertex_b_d) { Dijkstra::Vertex.new(node_b, node_d, 15) }
  let(:vertex_a_c) { Dijkstra::Vertex.new(node_a, node_c, 20) }
  let(:vertex_c_d) { Dijkstra::Vertex.new(node_c, node_d, 30) }
  let(:vertex_b_e) { Dijkstra::Vertex.new(node_b, node_e, 50) }
  let(:vertex_d_e) { Dijkstra::Vertex.new(node_d, node_e, 30) }

  let(:graph) do
    graph = Dijkstra::Graph.new
    graph.add_vertex(vertex_a_b)
    graph.add_vertex(vertex_b_d)
    graph.add_vertex(vertex_a_c)
    graph.add_vertex(vertex_c_d)
    graph.add_vertex(vertex_b_e)
    graph.add_vertex(vertex_d_e)

    graph
  end

  context "A to A" do
    subject { described_class.new(graph, node_a, node_a) }

    describe "#shortest_path" do
      it { expect(subject.shortest_path).to eq "A" }
    end

    describe "#shortest_distance" do
      it { expect(subject.shortest_distance).to eq 0 }
    end
  end

  context "A to B" do
    subject { described_class.new(graph, node_a, node_b) }

    describe "#shortest_path" do
      it { expect(subject.shortest_path).to eq "A -> B" }
    end

    describe "#shortest_distance" do
      it { expect(subject.shortest_distance).to eq 10 }
    end
  end

  context "A to E" do
    subject { described_class.new(graph, node_a, node_e) }

    describe "#shortest_path" do
      it { expect(subject.shortest_path).to eq "A -> B -> D -> E" }
    end

    describe "#shortest_distance" do
      it { expect(subject.shortest_distance).to eq 55 }
    end
  end

  context "B to E" do
    subject { described_class.new(graph, node_b, node_e) }

    describe "#shortest_path" do
      it { expect(subject.shortest_path).to eq "B -> D -> E" }
    end

    describe "#shortest_distance" do
      it { expect(subject.shortest_distance).to eq 45 }
    end
  end

  context "A to F" do
    subject { described_class.new(graph, node_a, node_f) }

    describe "#shortest_path" do
      it { expect(subject.shortest_path).to eq "A -> F" }
    end

    describe "#shortest_distance" do
      it { expect(subject.shortest_distance).to eq 0 }
    end
  end
end
