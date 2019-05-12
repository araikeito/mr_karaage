# frozen_string_literal: true

class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.text :material_name
      t.string :material_quantity
      t.integer :recipe_id

      t.timestamps
    end
  end
end
