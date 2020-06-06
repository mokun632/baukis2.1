require 'rails_helper'

RSpec.describe Adminstrator, type: :model do
  describe "#password=" do
    example "文字列を与えると、hashed_passwordは長さ60の文字列になる" do
      admintrator = Adminstrator.new
      admintrator.password = "baukis"
      expect(admintrator.hashed_password).to be_kind_of(String)
      expect(admintrator.hashed_password.size).to eq(60)
    end

    example "nilを与えるとhashed_passwordはnilになる" do
      admintrator = Adminstrator.new(hashed_password: "x")
      admintrator.password = nil
      expect(admintrator.hashed_password).to be_nil
    end
  end
end
