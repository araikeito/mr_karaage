class AddReviewTextToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :review_text, :string
  end
end
