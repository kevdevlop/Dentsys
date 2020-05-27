class BranchOfficesController < ApplicationController
  before_action :authorize_request
  before_action :get_client, only: [:create]

  def index
    branch_offices = BranchOffice.all
    render json: branch_offices
  end

  def show
    branch_office = BranchOffice.find(params[:id])
    render json: branch_office
  end

  def create
    branch_office = @client.branch_offices.new(branch_office_params)

    if branch_office.save
      data = branch_office
      status = :created
    else
      data = branch_office.errors.as_json
      status = :unprocessable_entity
    end

    render json: data, status: status
  end

  def update
  end

  def destroy
  end

  private

  def branch_office_params
    params_permitted = params.require(:branch_office).permit(
      :name,
      :razon_social,
      :rfc,
      :city,
      :zip_code,
      :address,
      :logo,
      :active,
      :state_catalogue_id
    )
  end
   
  def get_client
    @client = Client.find(params[:client_id])
  end
end
