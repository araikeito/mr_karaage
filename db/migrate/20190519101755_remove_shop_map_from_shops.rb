class RemoveShopMapFromShops < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :shop_map, :text
  end
end
