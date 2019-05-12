# frozen_string_literal: true

class AddSaltToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :salt, :string
  end
end
