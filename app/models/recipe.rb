# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_many :materials, dependent: :destroy
  accepts_nested_attributes_for :materials, allow_destroy: true

  has_many :progresses, dependent: :destroy
  accepts_nested_attributes_for :progresses, allow_destroy: true

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :review_replays, dependent: :destroy

  validates :recipe_name, length: { in: 5..30 }
  validates :meat_site, presence: true
  validates :advice, length: { in: 1..30 }

  attachment :recipe_image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
