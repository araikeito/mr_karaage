# frozen_string_literal: true

class RemoveShopImageFromShops < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :shop_image, :text
  end
end
