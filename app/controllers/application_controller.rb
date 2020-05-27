class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  require "browser"

  # called before every action on controllers
  before_action :authorize_request
  attr_reader :current_user

  def remote_ip
    if Rails.env == "development"
      # Hard coded remote address
      '123.45.67.89'
    else
      request.remote_ip
    end
  end

  def device_type
    agent = request.user_agent

    return :tablet if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
    return :mobile if agent =~ /Mobile/
    return :web
  end

  private

  # Check for valid request token and return user
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end
