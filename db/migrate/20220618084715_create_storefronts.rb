class CreateStorefronts < ActiveRecord::Migration[7.0]
  def change
    create_table :storefronts do |t|
      t.string :storefront_code
      t.string :storefront_name

      t.timestamps

      t.index [:storefront_code], name: 'index_storefront_on_storefront_code', unique: true
    end
  end
end
