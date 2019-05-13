# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :review_text, presence: true

end
