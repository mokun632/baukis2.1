module ErrorHandlers
  extend ActiveSupport::Concern


  included do

    rescue_from StandardError, with: :rescue500
    rescue_from ApplicationContoroller::Forbidden, with: :rescue403
    rescue_from ApplicationContoroller::IpAddressRejected, with: :rescue403
    rescue_from ActiveRecord::RecordNotFound, with: :rescue404

    private def rescue403(e)
      @exception = e
      render "errors/forbidden", status: 403
    end

    private def rescue404(e)
      @exception = e
      render "errors/not_found", status: 404
    end

    private def rescue500(e)
      render "errors/internal_server_error", status: 500
    end
  end

end
