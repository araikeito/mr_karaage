class RemoveRecipeImageFromRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :recipe_image, :text
  end
end
