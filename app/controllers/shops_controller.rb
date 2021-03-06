# frozen_string_literal: true

class ShopsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit, :create, :destroy, :update]
  before_action :ensure_correct_user, only:[:new, :edit, :create, :destroy, :update]
  def index
    @search = Shop.ransack(params[:q])
    @shops = if params[:q]
               @search.result.page(params[:page]).per(10).reverse_order
             else
               Shop.all.page(params[:page]).per(10).reverse_order
             end
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def create
    shop = Shop.new(shop_params)
    shop.save
    redirect_to shops_path
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to shops_path
  end

  def new
    @shop = Shop.new
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    shop = Shop.find(params[:id])
    shop.update(shop_params)
    redirect_to shop_path(shop)
  end

  def ensure_correct_user
    if current_user.admin == false
      flash[:notice] = "許可されていないアクションです"
      redirect_to root_path
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_name, :shop_image, :shop_phone_number,
                                 :shop_address, :business_hours, :average_price, :soysauce, :salt, :other)
  end
end
