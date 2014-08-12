require 'spec_helper'

describe Dijkstra::Node do
  describe "#to_s" do
    subject { described_class.new("Node A") }

    it "return node name" do
      expect(subject.to_s).to eq "Node A"
    end
  end
end
