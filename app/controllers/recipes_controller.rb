# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.page(params[:page]).per(10).reverse_order
    @rank = Recipe.find(Favorite.group(:recipe_id).order('count(recipe_id) desc').limit(5).pluck(:recipe_id))
  end

  def show
    @recipe = Recipe.find(params[:id])
    @review = Review.new
  end

  def create
    recipe = Recipe.new(recipe_params)
    recipe.user_id = current_user.id
    recipe.save
    redirect_to recipes_path
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path
  end

  def new
    @recipe = Recipe.new
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
    params.require(:recipe).permit(:recipe_name, :recipe_image, :meat_site, :advice,
                                   materials_attributes: [:id, :material_name, :material_quantity, :_destroy],
                                   progresses_attributes: [:id, :progress_number, :material_image, :progress_text, :_destroy])
  end
end
