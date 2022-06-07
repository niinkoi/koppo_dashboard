FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { 'username' }
    email { Faker::Internet.email }
    password { 'user@123' }
  end
end
