# frozen_string_literal: true

class RemoveShopTasteFromShops < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :shop_taste, :string
  end
end
