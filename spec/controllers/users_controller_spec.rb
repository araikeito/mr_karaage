require "rails_helper"

RSpec.describe UsersController, type: :controller do

	describe 'ユーザー詳細ページ' do
		context "ユーザー詳細ページが表示される" do
			before do
				user = create(:user)
				get :show, params:{id:user.id}
			end
			it 'リクエストは200 OKとなること' do
				expect(response.status).to eq 200
			end
		end
	end

	# describe 'ユーザー編集ページ' do
	# 	context "ユーザー編集ページが表示される" do
	# 		before do
	# 			@user = create(:user)
	# 			sign_in @user

	# 			if @user.id == current_user.id
	# 			end
	# 		end
	# 		it 'リクエストは200 OKとなること' do
	# 			get :edit, params:{id:@user.id}
	# 			expect(response.status).to eq 200
	# 		end
	# 	end
	# end

	describe 'ユーザー一覧ページ' do
		context "ユーザー一覧ページが表示される" do
			before do
				user = create(:user)
				user.update(admin: true)
				sign_in user
			end
			it 'リクエストは200 OKとなること' do
				get :index
				expect(response.status).to eq 200
			end
		end
	end
end