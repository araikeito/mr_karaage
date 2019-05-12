# frozen_string_literal: true

class ChangeDatatypeShopPhoneNumberOfShops < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :shop_phone_number, :string
  end
end
