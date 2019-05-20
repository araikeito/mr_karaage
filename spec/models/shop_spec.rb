require 'rails_helper'

RSpec.describe Shop, type: :model do
	context "データが正しく保存される" do
		 before do
		 	@shop = Shop.new
		 	@shop.shop_name = "唐揚げ"
		 	@shop.shop_phone_number = "000-0000-0000"
		 	@shop.shop_address = "福井県"
		 	@shop.business_hours = "朝から晩まで"
		 	@shop.average_price = "2000~3000"
		 	@shop.save
		 end
		  it "全て入力してあるので保存される" do
		  	expect(@shop).to be_valid
		  end

	end
	context "データが正しく保存されない" do
		before do
			@shop = Shop.new
			@shop.shop_name = ""
		 	@shop.shop_phone_number = "000-0000-0000"
		 	@shop.shop_address = "福井県"
		 	@shop.business_hours = "朝から晩まで"
		 	@shop.average_price = "2000~3000"
		 	@shop.save
		end
		it "タイトルが入力されていないので保存されない" do
			expect(@shop).to be_invalid
			expect(@shop.errors[:shop_name]).to include("can't be blank")
		end
	end
end