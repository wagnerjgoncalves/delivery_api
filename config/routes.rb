DeliveryApi::Application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :maps, only: [:create, :index, :show]
    resources :map_routes, only: [:create, :show]
  end
end
