# frozen_string_literal: true

class Progress < ApplicationRecord
  belongs_to :recipe

  attachment :material_image
end
