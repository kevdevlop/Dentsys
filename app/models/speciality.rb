class Speciality < ApplicationRecord
  has_many :speciality_doctors, dependent: :destroy
  has_many :doctors, through: :speciality_doctors

  has_many :service_specialities, dependent: :destroy
  has_many :services, through: :service_specialities
end
