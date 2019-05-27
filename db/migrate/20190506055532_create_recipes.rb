# frozen_string_literal: true

class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :recipe_name
      t.text :recipe_image
      t.string :meat_site
      t.text :advice
      t.integer :user_id

      t.timestamps
    end
  end
end
