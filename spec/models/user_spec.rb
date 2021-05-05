require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "Must be created with a password." do
      @user = User.create(
        first_name: "John",
        last_name: "Doe",
        email: "john@test.com",
        password: nil,
        password_confirmation: "test")
      expect(@user).to_not be_valid
      puts @user.errors.full_messages
    end
  end
end
