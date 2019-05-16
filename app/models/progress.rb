# frozen_string_literal: true

class Progress < ApplicationRecord
  belongs_to :recipe

  validates :progress_number, presence: true
  validates :progress_text, length: { in: 5..60 }

  attachment :material_image
end
