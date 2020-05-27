class UserLoginHistoric < ApplicationRecord
  belongs_to :user
  
  enum device_type: [
    :web,
    :mobile,
    :tablet,
    :other
  ]
end
