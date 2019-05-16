class ReviewReplay < ApplicationRecord

  belongs_to :user
  belongs_to :recipe
  belongs_to :review

  validates :text, presence: true

end
