class Progress < ApplicationRecord

	belongs_to :recipe

	attachment :progress_image
end
