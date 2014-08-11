class MapRouteSerializer < ActiveModel::Serializer
  attributes :id, :from, :to, :distance
end
