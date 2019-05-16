class AddTextToReviewReplays < ActiveRecord::Migration[5.2]
  def change
    add_column :review_replays, :text, :text
  end
end
