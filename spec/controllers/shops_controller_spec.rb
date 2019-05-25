require "rails_helper"

# RSpec.describe ShopsController, type: :controller do
# 	describe 'お店追加ページ' do
# 		context "お店追加ページが表示される" do
# 			before do
# 				get :new
# 			end
# 			it 'リクエストは200 OKとなること' do
# 				expect(response.status).to eq 200
# 			end
# 		end
# 	end
# end

RSpec.describe ShopsController, type: :controller do
	describe 'お店一覧ページ' do
		context "お店一覧ページが表示される" do
			before do
				get :index
			end
			it 'リクエストは200 OKとなること' do
				expect(response.status).to eq 200
			end
		end
	end

	describe 'お店詳細ページ' do
		context "お店詳細ページが表示される" do
			before do
				@shop = Shop.new
				@shop.shop_name = "test"
				@shop.shop_address ="test_address"
				@shop.shop_phone_number = "09012341234"
				@shop.business_hours = "12"
				@shop.save
			end
			it 'リクエストは200 OKとなること' do
				get :show, params:{id:@shop.id}
				expect(response.status).to eq 200
			end
		end
	end

	describe 'お店投稿ページ' do
		context "お店投稿ページが表示される" do
			before do
				user = create(:user)
				user.update(admin: true)
				sign_in user
				get :new
			end
			it 'リクエストは200 OKとなること' do
				expect(response.status).to eq 200
			end
		end
	end

	describe 'お店編集ページ' do
		context "お店編集ページが表示される" do
			before do
				user = create(:user)
				user.update(admin: true)
				sign_in user
				@shop = Shop.new
				@shop.shop_name = "test"
				@shop.shop_address ="test_address"
				@shop.shop_phone_number = "09012341234"
				@shop.business_hours = "12"
				@shop.save
		    end
			it 'リクエストは200 OKとなること' do
				get :edit, params:{id:@shop.id}
				expect(response.status).to eq 200
			end
		end
	end

end
