class CreateLocationDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :location_details do |t|
      t.string :location_city
      t.string :location_district
      t.string :location_ward

      t.timestamps
    end
  end
end
