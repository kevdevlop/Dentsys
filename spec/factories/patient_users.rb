FactoryBot.define do
  factory :patient_user do
    patient
    user
    client
  end
end