class CreateMapRoutes < ActiveRecord::Migration
  def change
    create_table :map_routes do |t|
      t.references :map
      t.string :from, null: false
      t.string :to, null: false
      t.integer :distance, null: false

      t.timestamps

      t.index [:from, :to, :map_id], unique: true
    end

    add_foreign_key :map_routes, :maps, column: :map_id
  end
end
