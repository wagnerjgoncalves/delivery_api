class MapRoute < ActiveRecord::Base
  belongs_to :map

  validates :from, :to, :distance, :map_id, presence: true
  validates :from, uniqueness: { scope: [ :to, :map_id] }
end
