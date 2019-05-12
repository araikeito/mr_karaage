# frozen_string_literal: true

class AddSoysauceToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :soysauce, :string
  end
end
