class AddReferencesToStorefronts < ActiveRecord::Migration[7.0]
  def change
    add_reference :storefronts, :location_detail, null: false, foreign_key: true
  end
end
