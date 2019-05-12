# frozen_string_literal: true

class AddDeletedAtToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :deleted_at, :datetime
    add_index :shops, :deleted_at
  end
end
