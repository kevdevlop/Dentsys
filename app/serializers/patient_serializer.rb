class PatientSerializer < ApplicationSerializer
  attributes :id, 
    :address, 
    :phone_number, 
    :mobile_number,
    :birthdate

  belongs_to :branch_office
  belongs_to :user
end
