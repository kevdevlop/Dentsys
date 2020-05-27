class BranchOffice < ApplicationRecord
  belongs_to :state_catalogue, optional: true
  belongs_to :client

  has_many :doctors, dependent: :destroy
  has_many :patients, dependent: :destroy
end
