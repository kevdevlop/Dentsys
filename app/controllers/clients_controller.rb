class ClientsController < ApplicationController
  before_action :authorize_request

  def index
    clients = Client.all

    render json: clients
  end

  def show
    client = Client.find(params[:id])
    
    render json: client
  end

  def create
    client = Client.new(client_params)

    if client.save
      response = client
      status_code = :created
    else
      response = client.errors.as_json
      status_code = :unprocessable_entity
    end

    render json: response, status: status_code
  end

  def update
  end

  def destroy
  end

  private

  def client_params
    params_permitted = params.require(:client).permit(
      :razon_social, 
      :rfc, 
      :state, 
      :city, 
      :zip_code, 
      :address, 
      :phone_number, 
      :mobile_number, 
      :logo, 
      :active
    )
  end
end
