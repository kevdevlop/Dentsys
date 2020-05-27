class ClinicHistory < ApplicationRecord
  belongs_to :patient
  belongs_to :service
  belongs_to :doctor

  has_many :medications
end
