require 'rails_helper'

RSpec.describe Review, type: :model do
	context "データが正しく保存される" do
		before do
			user = create(:user)
			recipe = Recipe.create(recipe_name: "test", meat_site: "もも肉", advice: "test", user_id: user.id)
			recipe.save
			@review = Review.new
			@review.review_text = "test"
			@review.user_id = user.id
			@review.recipe_id = recipe.id
			@review.save
		end
		it "全て入力してあるので保存される" do
		  	expect(@review).to be_valid
		 end
	end
end