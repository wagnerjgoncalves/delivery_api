require 'rails_helper'

describe API::MapsController do

  describe "GET #index" do
    let!(:map) { create(:map) }

    before do
      get :index
    end

    it { expect(response.status).to eq 200 }

    it { expect(response.header['Content-Type']).to include 'application/json' }

    it 'renders json object with all maps' do
      json = JSON.parse(response.body)

      expect(json.length).to eq 1

      expect(json[0]["id"]).to eq map.id
      expect(json[0]["name"]).to eq map.name
      expect(json[0]["map_routes"].length).to eq 6
    end
  end

  describe "POST #create" do
    context "success" do
      let!(:params) { FactoryGirl.attributes_for(:map) }

      before do
        post :create, params
      end

      it { expect(response.status).to eq 200 }

      it 'renders json object' do
        json = JSON.parse(response.body)

        expect(json["name"]).to eq params[:name]
      end
    end

    context "error" do
      before do
        post :create
      end

      it { expect(response.status).to eq 200 }

      it 'renders json error object' do
        json = JSON.parse(response.body)

        expect(json["name"]).to include "can't be blank"
      end
    end
  end
end
