class ReviewReplaysController < ApplicationController
	before_action :set_recipe, only: [:create, :destroy]
	before_action :set_review, only: [:create, :destroy]
	before_action :authenticate_user!


	def new
	  @review_replay = ReviewReplay.new
    end

	def create
	  @review_replay = @recipe.review_replays.build(review_replay_params)
	  @review_replay.user_id = current_user.id
	  @review_replay.review_id = params[:review_id]
	  set_replays
	  if
		@review_replay.save
		render :index
	  end
	end

	def destroy
	  @review_replay = ReviewReplay.find(params[:id])
	  @review_replay.destroy
	   set_replays
	   render :index
	end

	private
	def review_replay_params
      params.require(:review_replay).permit(:text, :recipe_id, :user_id, :review_id)
    end

    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

    def set_review
      @review = Review.find(params[:review_id])
    end

    def set_replays
      @review_replays = @recipe.review_replays.includes(:user)
    end

end
