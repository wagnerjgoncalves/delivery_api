require 'spec_helper'

describe API::MapRoutesController do
  let!(:map) { FactoryGirl.create(:map) }

  describe "POST #create" do
    context "success" do
      let!(:params) do
        FactoryGirl.attributes_for(:map_route, from: "J", to: "K",
                                               distance: 100, map_id: map.id)
      end

      before do
        post :create, params
      end

      it { expect(response.status).to eq 200 }

      it 'renders json object' do
        json = JSON.parse(response.body)

        expect(json["from"]).to eq  "J"
        expect(json["to"]).to eq "K"
        expect(json["distance"]).to eq 100
      end
    end

    context "error" do
      before do
        post :create
      end

      it { expect(response.status).to eq 200 }

      it 'renders json error object' do
        json = JSON.parse(response.body)

        expect(json["from"]).to include "can't be blank"
        expect(json["to"]).to include "can't be blank"
        expect(json["distance"]).to include "can't be blank"
        expect(json["map_id"]).to include "can't be blank"
      end
    end
  end
end
