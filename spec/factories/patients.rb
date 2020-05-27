FactoryBot.define do
  factory :patient do
    address { Faker::Address.street_address }
    phone_number { Faker::PhoneNumber.phone_number }
    mobile_number { Faker::PhoneNumber.cell_phone}
  end
end