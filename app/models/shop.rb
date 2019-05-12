# frozen_string_literal: true

class Shop < ApplicationRecord
  has_many :reviews, dependent: :destroy

  attachment :shop_image

  acts_as_paranoid

  ratyrate_rateable 'shop_name'
end
