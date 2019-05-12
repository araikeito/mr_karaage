# frozen_string_literal: true

class AddShopIdToTastes < ActiveRecord::Migration[5.2]
  def change
    add_column :tastes, :shop_id, :integer
  end
end
