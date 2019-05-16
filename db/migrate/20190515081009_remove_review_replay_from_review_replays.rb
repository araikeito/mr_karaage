class RemoveReviewReplayFromReviewReplays < ActiveRecord::Migration[5.2]
  def change
    remove_column :review_replays, :review_replay, :string
  end
end
