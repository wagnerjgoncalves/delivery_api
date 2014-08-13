class API::DeliveriesController < ApplicationController
  def index
    render json: Delivery.new(params).calculate
  end
end
