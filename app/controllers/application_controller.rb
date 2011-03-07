class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_admin
    unless current_user && current_user.admin?
      render :template => "layouts/invalid_permissions"
    end
  end
end
