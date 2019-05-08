class Shop < ApplicationRecord

	has_many :reviews, dependent: :destroy

	attachment :shop_image

	acts_as_paranoid
end
