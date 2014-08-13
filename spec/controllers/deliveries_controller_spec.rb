require 'spec_helper'

describe API::DeliveriesController do
  let!(:map) { FactoryGirl.create(:map) }

  describe "GET #index" do
    let!(:params) do
      {
        map: map.name,
        autonomy: 10,
        fuel_cost: 2.5,
        from: "A",
        to: "B"
      }
    end

    before do
      get :index, params
    end

    it { expect(response.status).to eq 200 }

    it { expect(response.header['Content-Type']).to include 'application/json' }

    it 'renders json object with route and cost attributes' do
      json = JSON.parse(response.body)

      expect(json["route"]).to eq "A -> B"
      expect(json["cost"]).to eq 2.5
    end
  end
end
