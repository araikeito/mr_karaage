# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit, :create, :destroy, :update]

  def index
    @recipes = Recipe.all.page(params[:page]).per(10).reverse_order
    @rank = Recipe.find(Favorite.group(:recipe_id).order('count(recipe_id) desc').limit(5).pluck(:recipe_id))
  end

  def show
    @recipe = Recipe.find(params[:id])
    @review = Review.new
    @reviews = @recipe.reviews
    @review_replays = @recipe.review_replays.includes(:user)
    @review_replay = @recipe.review_replays.build(user_id: current_user.id) if current_user
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe, notice: '投稿しました。' }
        format.json { render :show, status: :created, location: @recipe }
        format.js { @status = "success"}
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
        format.js { @status = "fail" }
      end
    end
    # recipe.user_id = current_user.id
    # recipe.save
    # redirect_to recipes_path
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path
  end

  def new
    @recipe = Recipe.new
    respond_to do |format|
      format.html{ redirect_to @recipe, notice: 'Recipe was successfully created.' }
      format.js {}
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update(recipe_params)
    redirect_to recipe_path(recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:recipe_name, :video, :recipe_image, :meat_site, :advice,
                                   materials_attributes: [:id, :material_name, :material_quantity, :_destroy],
                                   progresses_attributes: [:id, :progress_number, :material_image, :progress_text, :_destroy])
  end
end
