# frozen_string_literal: true

class Shop < ApplicationRecord
  has_many :reviews, dependent: :destroy


  validates :shop_name, presence: true
  validates :shop_phone_number, presence: true
  validates :shop_address, presence: true
  validates :shop_map, presence: true

  attachment :shop_image

  acts_as_paranoid

  ratyrate_rateable 'shop_name'
end
