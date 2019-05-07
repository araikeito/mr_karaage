class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :shop_name
      t.text :shop_image
      t.integer :shop_phone_number
      t.text :shop_address
      t.string :business_hours
      t.integer :average_price
      t.text :shop_map
      t.string :shop_taste

      t.timestamps
    end
  end
end
