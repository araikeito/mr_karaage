FactoryBot.define do
  factory :group do
    name { "名前" }
    name_kana { "ナマエ" }
    email { "arai@arai" }
    address { "東京都" }
    phone_number {"111-1111-1111"}
    password {"araiarai"}
    password_confirmation {"araiarai"}
    user
  end
end