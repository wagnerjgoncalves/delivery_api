class Map < ActiveRecord::Base
  has_many :map_routes, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :map_routes
end
