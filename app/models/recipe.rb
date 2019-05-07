class Recipe < ApplicationRecord

	 has_many :materials
	 has_many :progresses
	 belongs_to :user
	 has_many :favorites
end
