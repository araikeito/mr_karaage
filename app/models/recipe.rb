class Recipe < ApplicationRecord

	 has_many :materials, dependent: :destroy
	 accepts_nested_attributes_for :materials, allow_destroy: true

	 has_many :progresses, dependent: :destroy
	 accepts_nested_attributes_for :progresses, allow_destroy: true

	 belongs_to :user
	 has_many :favorites, dependent: :destroy

	 attachment :recipe_image

	def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

	 acts_as_paranoid
end
