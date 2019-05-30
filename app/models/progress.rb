# frozen_string_literal: true

class Progress < ApplicationRecord
  belongs_to :recipe

  validates :progress_number, presence: true
  validates :progress_text, presence: true

  attachment :material_image
end
