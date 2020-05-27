FactoryBot.define do
  factory :client do
    razon_social { Faker::Company.name}
    rfc { Faker::Company.duns_number}
    state {Faker::Address.state}
    city {Faker::Address.city}
    postal_code{ Faker::Address.zip}
    address { Faker::Address.street_address }
    active { true }
    logo { Faker::Company.logo }
  end
end