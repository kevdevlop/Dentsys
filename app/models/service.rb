class Service < ApplicationRecord
  has_many :service_specialities, dependent: :destroy
  has_many :specialities, through: :service_specialities
end
