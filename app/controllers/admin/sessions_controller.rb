class Admin::SessionsController < Admin::Base
  skip_before_action :authorize

  def new
    if current_adminstrator
      redirect_to :admin_root
    else
      @form = Admin::LoginForm.new
      render action: "new"
    end
  end

  def create
    @form = Admin::LoginForm.new(login_form_params)
    if @form.email.present?
      adminstrator = Adminstrator.find_by("LOWER(email) = ?", @form.email.downcase)
    end

    if Admin::Authenticator.new(adminstrator).authenticate(@form.password)
      if adminstrator.suspended?
        flash.now.alert = "アカウントが停止されています。"
        render action: "new"
      else
        session[:adminstrator_id] = adminstrator.id
        session[:admin_last_access_time] = Time.current
        flash.notice = "ログインできました。"
        redirect_to :admin_root
      end
    else
      flash.now.alert = "メールアドレスまたはパスワードが間違っています"
      render action: "new"
    end
  end

  private def login_form_params
    params.require(:admin_login_form).permit(:email, :password)
  end
  

  def destroy
    session.delete(:adminstrator_id)
    flash.notice = "ログアウトしました。"
    redirect_to :admin_root
  end
end
