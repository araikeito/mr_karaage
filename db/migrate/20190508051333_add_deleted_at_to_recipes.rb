# frozen_string_literal: true

class AddDeletedAtToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :deleted_at, :datetime
    add_index :recipes, :deleted_at
  end
end
