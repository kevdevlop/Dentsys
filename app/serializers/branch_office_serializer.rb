class BranchOfficeSerializer <  ApplicationSerializer
  attributes :id,
    :name,
    :razon_social,
    :address,
    :zip_code,
    :logo

    belongs_to :state_catalogue
    belongs_to :client
end
