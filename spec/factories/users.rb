FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'000000a'}
    password_confirmation {'000000a'}
    last_name             {'山田'}
    first_name            {'隆太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'リクタロウ'}
    birth_date            {'1931-09-09'}
  end
end