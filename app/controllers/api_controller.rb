class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  private
  def authenticated?
    authenticate_or_request_with_http_basic do |email, password|
      @logged_user = User.find_by_email(email)
      valid = @logged_user.valid_password?(password)
      puts valid
      valid
    end
  end
end
