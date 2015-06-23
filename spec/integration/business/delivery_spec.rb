require 'rails_helper'

describe Delivery do
  let!(:map) { create(:map) }

  context "delivery from A to D with autonomy: 10 and fuel_cost: 2.5" do
    subject do
      described_class.new(map: map.name, autonomy: 10, fuel_cost: 2.5, from: "A", to: "D")
    end

    describe "#calculate" do
      it { expect(subject.calculate[:route]).to eq "A -> B -> D" }
      it { expect(subject.calculate[:cost]).to eq 6.25 }
    end
  end

  context "delivery from A to E with autonomy: 7 and fuel_cost: 3.5" do
    subject do
      described_class.new(map: map.name, autonomy: 7, fuel_cost: 3.5, from: "A", to: "E")
    end

    describe "#calculate" do
      it { expect(subject.calculate[:route]).to eq "A -> B -> D -> E" }
      it { expect(subject.calculate[:cost]).to eq 27.5 }
    end
  end

  context "delivery from A to E with autonomy: 7 and fuel_cost: 0" do
    subject do
      described_class.new(map: map.name, autonomy: 7, fuel_cost: 0, from: "A", to: "E")
    end

    describe "#calculate" do
      it { expect(subject.calculate[:route]).to eq "A -> B -> D -> E" }
      it { expect(subject.calculate[:cost]).to eq 0.0 }
    end
  end

  context "delivery from A to E with autonomy: 0 and fuel_cost: 2.5" do
    subject do
      described_class.new(map: map.name, autonomy: 0, fuel_cost: 2.5, from: "A", to: "E")
    end

    describe "#calculate" do
      it { expect(subject.calculate[:route]).to eq "A -> B -> D -> E" }
      it { expect(subject.calculate[:cost]).to eq 0.0 }
    end
  end
end
