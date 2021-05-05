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

    it "The password must have a minimum length when a user account is being created." do
      @user = User.create(
        first_name: "John",
        last_name: "Doe",
        email: "john@test.com",
        password: "test",
        password_confirmation: "test")
      expect(@user).to_not be_valid
      puts @user.errors.full_messages
    end

    it "Emails must be unique and not case sensitive." do
      @user1 = User.create(
        first_name: "John",
        last_name: "Doe",
        email: "john@test.com",
        password: "realtest",
        password_confirmation: "realtest")
      @user2 = User.create(
        first_name: "John",
        last_name: "Doe",
        email: "JOHN@TEST.com",
        password: "realtest",
        password_confirmation: "realtest")
      expect(@user2).to_not be_valid
      puts @user2.errors.full_messages
    end

    it "Should have a valid email" do
      @user = User.create(
        first_name: "John",
        last_name: "Doe",
        email: nil,
        password: "realtest",
        password_confirmation: "realtest")
      expect(@user).to_not be_valid
      puts @user.errors.full_messages
    end

    it "Should have a valid first name" do
      @user = User.create(
        first_name: nil,
        last_name: "Doe",
        email: "john@test.com",
        password: "realtest",
        password_confirmation: "realtest")
      expect(@user).to_not be_valid
      puts @user.errors.full_messages
    end

    it "Should have a valid last name" do
      @user = User.create(
        first_name: "John",
        last_name: nil,
        email: "john@test.com",
        password: "realtest",
        password_confirmation: "realtest")
      expect(@user).to_not be_valid
      puts @user.errors.full_messages
    end
  end
end
