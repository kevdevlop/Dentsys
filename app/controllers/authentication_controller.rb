class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate
  
  # return auth token once user is authenticated
  def authenticate
    auth_token =
      AuthenticateUser.new(auth_params[:email], auth_params[:password]).call

    user = User.find_by(email: auth_params[:email])
    
    user.user_login_historics.create(
      device_type: device_type,
      signin_ip: remote_ip
    )
    
    user.update(sign_in_count: user.sign_in_count+1)
    
    json_response(auth_token: auth_token, username: user.name)
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
