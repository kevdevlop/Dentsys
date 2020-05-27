FactoryBot.define do
  factory :client_user do
    client
    user
    active { true }
  end
end