class API::MapsController < ApplicationController
  def index
    @maps = Map.all

    render json: @maps, root: false
  end

  def create
    object = Map.new(resource_params)

    if object.valid?
      object.save!

      render json: object, root: false
    else
      render json: object.errors
    end
  end

  private

  def resource_params
    params.permit(:name, :map_routes_attributes)
  end
end
