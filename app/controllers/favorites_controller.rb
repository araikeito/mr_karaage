# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :set_recipe

  def create
    @favorite = Favorite.create(user_id: current_user.id, recipe_id: params[:recipe_id])
    @favorites = Favorite.where(recipe_id: params[:recipe_id])
    @recipe.reload
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, recipe_id: params[:recipe_id])
    favorite.destroy
    @favorites = Favorite.where(recipe_id: params[:recipe_id])
    @recipe.reload
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

end
