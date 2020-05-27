class Doctor < ApplicationRecord
  belongs_to :branch_office
  belongs_to :user

  validates_presence_of :name, :last_name

  has_many :speciality_doctors, dependent: :destroy
  has_many :specialities, through: :speciality_doctors

  def create_user(user_params)
    user_doctor = User.new(user_params)
  
    user_doctor.is_active = true
    user_doctor.user_type = :doctor
    user_doctor.password = "123456789"
    user_doctor.client = self.branch_office.client
    user_doctor.name = self.name
    user_doctor.last_name = self.last_name

    user_doctor.save!

    self.user = user_doctor
  end
end
