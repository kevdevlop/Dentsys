class PatientsController < ApplicationController
  before_action :authorize_request
  before_action :get_branch_office, only: [:create]
  
  def index
    patients = Patient.all
    render json: patients
  end

  def show
    patient = Patient.find(params[:id])
    render json: patient
  end

  def create
    patient = @branch_office.patients.new(patient_params)

    if patient.save
      data = patient
      status = :created
    else
      data = patient.errors.as_json
      status = :unprocessable_entity
    end

    render json: data, status: status
  end

  def update
    patient = Patient.find(params[:id])

    if patient.update(patient_params)
      data = patient
      status = :ok
    else
      data = patient.errors.as_json
      status = :unprocessable_entity
    end

    render json: patient
  end

  def destroy
  end

  private

  def patient_params
    params_permitted = params.require(:patient).permit(
      :address,
      :phone_number,
      :mobile_number,
      :birthdate,
    )
  end

  def get_branch_office
    @branch_office = BranchOffice.find(params[:branch_office_id])
  end

end
