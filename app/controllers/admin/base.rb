class Admin::Base < ApplicationController
  private def current_adminstrator
    if session[:adminstrator_id]
      @current_adminstrator ||= 
        Adminstrator.find_by(id: session[:adminstrator_id])
    end
  end

  helper_method :current_adminstrator
end
