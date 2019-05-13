# frozen_string_literal: true

class ReviewsController < ApplicationController
  def create
  	recipe = Recipe.find(params[:recipe_id])
  	review_text = current_user.reviews.new(review_params)
  	review_text.recipe_id = recipe.id
  	review_text.save
  	redirect_to recipe_path(recipe)
  end

  def destroy
  	# recipe = Recipe.find(params[:recipe_id])
  	review = Review.find(params[:recipe_id]) #name change
  	# review_text = current_user.reviews.find_by(recipe_id: recipe.id)
  	# review_text.destroy
  	review.destroy
  	redirect_to recipes_path
  end

  private

  def review_params
  	params.require(:review).permit(:user_id, :recipe_id, :review_text)
  end
end
