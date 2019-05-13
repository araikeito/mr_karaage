# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(5).reverse_order
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  def destroy
    @user = User.find(params[:id])
    @recipes = Recipe.find_by(user_id: params[:id])
    flash[:notice] = "ユーザーを削除しました！"

    if @recipes.nil?
      @user.destroy
      redirect_to root_path
    else
      @recipes.destroy
      @user.destroy
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email, :name, :name_kana, :address, :phone_number
    )
  end
end
