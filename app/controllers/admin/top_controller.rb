class Admin::TopController < Admin::Base
  skip_before_action :authorize

  def index
    if current_adminstrator
      render action: "dashboard"
    else
      render action:"index"
    end
  end
end
