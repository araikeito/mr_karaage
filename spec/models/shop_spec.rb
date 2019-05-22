require 'rails_helper'

# バリデーションかかってるところだけ

RSpec.describe Shop, type: :model do
	context "データが正しく保存される" do
		 before do
		 	@shop = Shop.new
		 	@shop.shop_name = "test"
		 	@shop.shop_phone_number = "000-0000-0000"
		 	@shop.shop_address = "test"
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
		 	@shop.shop_address = "test"
		 	@shop.save
		end
		it "お店名が入力されていないので保存されない" do
			expect(@shop).to be_invalid
			expect(@shop.errors[:shop_name]).to include("can't be blank")
		end
	end

	context "データが正しく保存されない" do
		before do
			@shop = Shop.new
			@shop.shop_name = "test"
		 	@shop.shop_phone_number = ""
		 	@shop.shop_address = "test"
		 	@shop.save
		end
		it "電話番号が入力されていないので保存されない" do
			expect(@shop).to be_invalid
			expect(@shop.errors[:shop_phone_number]).to include("can't be blank")
		end
	end
	context "データが正しく保存されない" do
		before do
			@shop = Shop.new
			@shop.shop_name = "test"
		 	@shop.shop_phone_number = "000-0000-0000"
		 	@shop.shop_address = ""
		 	@shop.save
		end
		it "お店の住所が入力されていないので保存されない" do
			expect(@shop).to be_invalid
			expect(@shop.errors[:shop_address]).to include("can't be blank")
		end
	end
end





