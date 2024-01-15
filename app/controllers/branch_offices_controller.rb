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
    result = BranchOfficesService::Create.new(@client, branch_office_params).call

    render json: result[:data], status: result[:status]
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
