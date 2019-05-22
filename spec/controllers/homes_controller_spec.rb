require "rails_helper"

RSpec.describe HomesController, type: :controller do
	describe 'TOPページ' do
		context "TOPページが表示される" do
			before do
				get :top
			end
			it 'リクエストは200 OKとなること' do
				expect(response.status).to eq 200
			end
		end
	end
end