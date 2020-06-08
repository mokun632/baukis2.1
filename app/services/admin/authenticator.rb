class Admin::Authenticator
  def initialize(adminstrator)
    @adminstrator = adminstrator
  end

  def authenticate(raw_password)
    @adminstrator &&
    @adminstrator.hashed_password &&
    BCrypt::Password.new(@adminstrator.hashed_password) == raw_password
  end
end
