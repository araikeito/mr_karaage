# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :review_replays, dependent: :destroy

  validates :email, presence: true
  validates :name, presence: true
  validates :name_kana, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true



  attachment :user_image

  acts_as_paranoid

  ratyrate_rater
end
