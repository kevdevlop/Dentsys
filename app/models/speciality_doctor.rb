class SpecialityDoctor < ApplicationRecord
  belongs_to :doctor
  belongs_to :speciality
end