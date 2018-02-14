class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    def check_authorization
      redirect_to :root unless Setting.project_page_enabled
    end
end
