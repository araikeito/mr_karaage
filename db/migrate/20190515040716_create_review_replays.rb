class CreateReviewReplays < ActiveRecord::Migration[5.2]
  def change
    create_table :review_replays, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :review_replay
      t.integer :user_id
      t.integer :recipe_id
      t.integer :review_id

      t.timestamps
    end
  end
end
