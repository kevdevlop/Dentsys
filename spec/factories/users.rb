# spec/factories/users.rb
FactoryBot.define do
    factory :user do
      name { Faker::Name.name }
      last_name { Faker::Name.last_name }
      email {'example@email.com'}
      password {'12345678'}
    end
  end