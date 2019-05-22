require "rails_helper"

RSpec.describe RecipesController, type: :controller do
	describe 'レシピ一覧ページ' do
		context "レシピ一覧ページが表示される" do
			before do
				get :index
			end
			it 'リクエストは200 OKとなること' do
				expect(response.status).to eq 200
			end
		end

	end

end
