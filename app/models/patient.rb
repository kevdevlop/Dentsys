class Patient < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :branch_office

  has_many :appointments, dependent: :destroy
  has_many :clinic_histories, dependent: :destroy
end
