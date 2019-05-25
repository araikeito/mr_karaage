require 'rails_helper'

RSpec.describe Recipe, type: :model do

	context "データが正しく保存される" do
		 before do
		 	user = create(:user)
		 	@recipe = Recipe.new
		 	@recipe.recipe_name = "test"
			@recipe.meat_site = "もも肉"
			@recipe.advice = "test"
			@recipe.user_id = user.id
			@recipe.save
		 end
		 it "全て入力してあるので保存される" do
		  	expect(@recipe).to be_valid
		 end
	end

	context "データが正しく保存されない" do
		before do
			user = create(:user)
		 	@recipe = Recipe.new
		 	@recipe.recipe_name = "aa"
			@recipe.meat_site = "もも肉"
			@recipe.advice = "test"
			@recipe.user_id = user.id
			@recipe.save
			@recipe.valid?
		end
		it "レシピ名が入力されていないので保存されない" do
			expect(@recipe).to be_invalid
			expect(@recipe.errors[:recipe_name][0]).to include("minimum is 3 characters")
		end
	end

	context "データが正しく保存されない" do
		before do
			user = create(:user)
		 	@recipe = Recipe.new
		 	@recipe.recipe_name = "test"
			@recipe.meat_site = "もも肉"
			@recipe.advice = "aa"
			@recipe.user_id = user.id
			@recipe.save
			@recipe.valid?
		end
		it "アドバイスが入力されていないので保存されない" do
			expect(@recipe).to be_invalid
			expect(@recipe.errors[:advice][0]).to include("minimum is 3 characters")
		end
	end

	context "データが正しく保存されない" do
		before do
			user = create(:user)
		 	@recipe = Recipe.new
		 	@recipe.recipe_name = "test"
			@recipe.meat_site = ""
			@recipe.advice = "test"
			@recipe.user_id = user.id
			@recipe.save
		end
		it "部位名が入力されていないので保存されない" do
			expect(@recipe).to be_invalid
			expect(@recipe.errors[:meat_site]).to include("can't be blank")
		end
	end
end
