require 'rails_helper'

RSpec.describe User, type: :model do
  context "given a new User instance" do
    it "should validate the presence of email" do
      expect(User.new(:email => "")).not_to be_valid
    end
  end
end
