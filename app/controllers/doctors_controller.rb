class DoctorsController < ApplicationController
  before_action :authorize_request
  before_action :get_branch_office, only: [:create]

  def index
    doctors = Doctor.all

    render json: doctors
  end

  def show
    doctor = Doctor.find(params[:id])

    render json:doctor
  end

  def create
    doctor = @branch_office.doctors.new(doctor_params)
    doctor.create_user(params.require(:user_data).permit!)
    
    if doctor.save
      data = doctor
      status = :ok
    else
      data = doctor.errors.as_json
      status = :unprocessable_entity
    end

    render json: data, status: status
  end

  def update
  end

  def destroy
  end

  private

  def doctor_params
    params_permitted = params.require(:doctor).permit(
      :name,
      :last_name,
      :id_number,
      :active
    )
  end

  def get_branch_office
    @branch_office = BranchOffice.find(params[:branch_office_id])
  end
end
