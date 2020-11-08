FactoryBot.define do
  factory :user do
    nick_name              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    last_name             {"太郎"}
    first_name            {"山田"}
    last_name_Kana        {"タロウ"}
    first_name_Kana       {"ヤマダ"}
    birth_date            {"1990-01-20"}
  end
end
