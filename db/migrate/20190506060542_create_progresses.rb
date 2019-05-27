# frozen_string_literal: true

class CreateProgresses < ActiveRecord::Migration[5.2]
  def change
    create_table :progresses, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :progress_number
      t.text :progress_text
      t.integer :recipe_id

      t.timestamps
    end
  end
end
