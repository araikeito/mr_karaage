require 'rails_helper'

RSpec.describe ReviewReplay, type: :model do
	context "データが正しく保存される" do
		before do
			user = create(:user)
			recipe = Recipe.create(recipe_name: "test", meat_site: "もも肉", advice: "test", user_id: user.id)
			recipe.save
			review = Review.create(recipe_id: recipe.id, user_id: user.id, review_text: "test")
			review.save
			@review_replay = ReviewReplay.new
			@review_replay.text = "test"
			@review_replay.user_id = user.id
			@review_replay.recipe_id = recipe.id
			@review_replay.review_id = review.id
			@review_replay.save
		end
		it "全て入力してあるので保存される" do
		  	expect(@review_replay).to be_valid
		 end
	end
end