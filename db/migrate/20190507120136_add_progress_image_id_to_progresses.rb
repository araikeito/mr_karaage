# frozen_string_literal: true

class AddProgressImageIdToProgresses < ActiveRecord::Migration[5.2]
  def change
    add_column :progresses, :progress_image_id, :string
  end
end
