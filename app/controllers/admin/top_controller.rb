class Admin::TopController < Admin::Base
  def index
    if current_adminstrator
      render action: "dashboard"
    else
      render action:"index"
    end
  end
end
