class RemoveDeletedAtFromRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_index :recipes, :deleted_at
    remove_column :recipes, :deleted_at, :datetime
  end
end
