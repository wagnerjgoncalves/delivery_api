class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :name, null: false, index: true

      t.timestamps
    end
  end
end
