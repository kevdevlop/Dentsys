class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    render json: @user, status: :ok
  end

  # POST /signup
  # return authenticated token upon signup
  def create
    user = User.new(user_params)
    
    if user.save
      auth_token = AuthenticateUser.new(user.email, user.password).call
      response = { message: Message.account_created, auth_token: auth_token }
      status_code = :created
    else
      response = user.errors.as_json
      status_code = :unprocessable_entity
    end
    
    render json: response, status: status_code
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :last_name,
      :password,
      :password_confirmation,
      :user_type
    )
  end

  def find_user
    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end
end
