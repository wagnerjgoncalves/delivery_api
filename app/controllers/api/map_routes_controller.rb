class API::MapRoutesController < ApplicationController
  def create
    object = MapRoute.new(resource_params)

    if object.valid?
      object.save!

      render json: object, root: false
    else
      render json: object.errors
    end
  end

  private

  def resource_params
    params.permit(:from, :to, :distance, :map_id)
  end
end
