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


	describe 'レシピ詳細ページ' do
		context "レシピ詳細ページが表示される" do
			before do
				#user = User.create(name: "名前" , name_kana: "ナマエ", email: "arai@arai",address:  "東京都",phone_number: "111-1111-1111",password: "araiarai", password_confirmation: "araiarai")
				user = create(:user)
				@recipe = Recipe.new
				@recipe.recipe_name = "test"
				@recipe.meat_site = "もも肉"
				@recipe.advice = "test"
				@recipe.user_id = user.id
				# @recipe.material_name = "test_material_name"
				# @recipe.material_quantity = "test_material_quantity"
				# @recipe.progress_number = "1"
				# @recipe.progress_text = "test_progress_text"
				@recipe.save
                #user = User.destroy(name: "名前" , name_kana: "ナマエ", email: "arai@arai",address:  "東京都",phone_number: "111-1111-1111",password: "araiarai", password_confirmation: "araiarai")
			end
			it 'リクエストは200 OKとなること' do
				get :show, params:{id:@recipe.id}
				expect(response.status).to eq 200
			end
		end
	end

	describe 'レシピ投稿ページ' do
		context "レシピ投稿ページが表示される" do
			before do
				user = create(:user)
				sign_in user
				get :new
			end
			it 'リクエストは200 OKとなること' do
				expect(response.status).to eq 200
			end
		end
	end

	describe 'レシピ編集ページ' do
		context "レシピ編集ページが表示される" do
			before do
				user = create(:user)
				sign_in user
				@recipe = Recipe.new
				@recipe.recipe_name = "test"
				@recipe.meat_site = "もも肉"
				@recipe.advice = "test"
				@recipe.user_id = user.id
				@recipe.save
		    end
			it 'リクエストは200 OKとなること' do
				get :edit, params:{id:@recipe.id}
				expect(response.status).to eq 200
			end
		end
	end

end
