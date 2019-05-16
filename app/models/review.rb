# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  has_many :review_replays, dependent: :destroy

  validates :review_text, presence: true

end
