class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def check_authorization
    redirect_to :root unless valid_user?
  end

  def valid_user?
  	user_signed_in? && current_user.email ="ethirajsrinivasan@gmail.com"
  end
end
