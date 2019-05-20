require "rails_helper"

RSpec.describe ShopsController, type: :controller do
	describe 'お店追加ページ' do
		context "お店追加ページが表示される" do
			before do
				get :new
			end
			it 'リクエストは200 OKとなること' do
				expect(response.status).to eq 200
			end
		end
	end
end