FactoryBot.define do
  factory :user do
    name { "名前 名前" }
    name_kana { "ナマエ　ナマエ" }
    email { "arai@arai" }
    address { "東京都" }
    phone_number {"111-1111-1111"}
    password {"araiarai"}
    password_confirmation {"araiarai"}
    user
  end
end