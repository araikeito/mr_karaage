# frozen_string_literal: true

class Material < ApplicationRecord
  belongs_to :recipe

  validates :material_name, length: { in: 1..20 }
  validates :material_quantity, length: { in: 1..10 }
end
