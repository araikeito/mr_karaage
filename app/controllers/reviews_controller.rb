# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_recipe, only: [:create, :destroy]
  before_action :authenticate_user!


  def new
    @review = Review.new
  end


  def create
  	@review = current_user.reviews.build(review_params)
    @review.recipe_id = @recipe.id
    set_replays
    set_replay
    if @review.save
      render :index
    end
  end

  def destroy
  	@review = Review.find(params[:id])
    set_replays
    set_replay
    if @review.destroy
      render :index
    end
  end

  private
  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def review_params
  	params.require(:review).permit(:user_id, :recipe_id, :review_text)
  end

  def set_replays
    @review_replays = @recipe.review_replays.includes(:user)
  end

  def set_replay
    @review_replay = @recipe.review_replays.build(user_id: current_user.id) if current_user
  end

end
