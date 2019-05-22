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
				@article = Shop.new
				@article.shop_name = "test"
				@article.shop_address ="test_address"
				@article.shop_phone_number = "09012341234"
				@article.business_hours = "12"
				@article.save
			end
			it 'リクエストは200 OKとなること' do
				get :show, params:{id:@article.id}
				expect(response.status).to eq 200
			end
		end
	end

end
