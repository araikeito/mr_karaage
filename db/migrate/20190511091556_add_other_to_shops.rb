# frozen_string_literal: true

class AddOtherToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :other, :string
  end
end
