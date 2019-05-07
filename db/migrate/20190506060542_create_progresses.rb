class CreateProgresses < ActiveRecord::Migration[5.2]
  def change
    create_table :progresses do |t|
      t.integer :progress_number
      t.text :progress_text
      t.integer :recipe_id

      t.timestamps
    end
  end
end
