class Admin::Base < ApplicationController
  before_action :authorize
  before_action :check_account
  before_action :check_timeout

  private def current_adminstrator
    if session[:adminstrator_id]
      @current_adminstrator ||=
        Adminstrator.find_by(id: session[:adminstrator_id])
    end
  end

  helper_method :current_adminstrator

  private def authorize
    unless current_adminstrator
      flash.alert = "管理者としてログインしてください。"
      redirect_to :admin_login
    end
  end

  private def check_account
    if current_adminstrator && current_adminstrator.suspended?
      session.delete(:adminstrator_id)
      flash.alert = "アカウントが無効になりました。"
      redirect_to :admin_root
    end
  end

  TIMEOUT = 60.minutes

  private def check_timeout
    if current_adminstrator
      if session[:admin_last_access_time] >= TIMEOUT.ago
        session[:admin_last_access_time] = Time.current
      else
        session.delete(:adminstrator_id)
        flash.alert = "セッションがタイムアウトしました。"
        redirect_to :admin_login
      end
    end
  end
end
