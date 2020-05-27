class Client < ApplicationRecord
  has_one :user, dependent: :destroy
  has_many :patients, dependent: :destroy
  has_many :branch_offices, dependent: :destroy

  validates :rfc, uniqueness: true

end
