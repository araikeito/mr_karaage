class AddVideoToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :video, :string
  end
end
