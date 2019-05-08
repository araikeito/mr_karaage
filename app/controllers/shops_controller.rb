class ShopsController < ApplicationController
  def index
  end

  def show
  end

  def create
    shop = Shop.new(shop_params)
    shop.save
    redirect_to shops_path
  end

  def destroy
  end

  def new
    @shop = Shop.new
  end

  def edit
  end

  def update
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_name, :shop_image, :shop_phone_number,
       :shop_address, :business_hours, :average_price, :shop_taste)
  end
end
