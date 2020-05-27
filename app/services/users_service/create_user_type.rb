module UsersService
  class CreateUserType
    def initialize(user)
      @user = user
    end

    def call(user_type, params)

      case user_type        
      when :patient
        patient = Patient.create!(params[:patient], user: @user)
      when :doctor
        doctor = Doctor.create!(params[:doctor], user: @user)
      else
      end
    end
  end
end