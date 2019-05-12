# frozen_string_literal: true

class ChangeDatatypeAveragePriceOfShops < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :average_price, :string
  end
end
