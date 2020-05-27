class DoctorSerializer < ActiveModel::Serializer
  attributes :id,
    :name,
    :last_name,
    :id_number,
    :active

    belongs_to :user
    belongs_to :branch_office
end
