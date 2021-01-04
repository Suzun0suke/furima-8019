FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"abc1111"}
    password_confirmation {password}
    last_name             {"苗字"}
    first_name            {"名前"}
    last_name_f           {"ミョウジ"}
    first_name_f          {"ナマエ"}
    birthday              {"1996-05-31"}
  end
end
