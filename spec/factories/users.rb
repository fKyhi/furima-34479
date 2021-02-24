FactoryBot.define do
  factory :user do
    nickname              { Faker::Name }
    email                 { Faker::Internet.free_email }
    password              { '111aaa' }
    password_confirmation { '111aaa' }
    last_name             { '安倍' }
    first_name            { '一郎' }
    last_name_kana        { 'アベ' }
    first_name_kana       { 'イチロウ' }
    user_birth_date       { '1995/12/24' }
  end
end
