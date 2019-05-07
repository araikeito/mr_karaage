class UsersController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def delete
  end

  private
  def user_params
    params.require(:user).permit(
      :email, :name, :name_kana, :address, :phone_number)
  end
end
