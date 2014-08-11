class MapSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :map_routes
end
