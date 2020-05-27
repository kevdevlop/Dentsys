class ClientSerializer < ActiveModel::Serializer
  attributes :id, :razon_social, :rfc, :address, :logo, :active
end
