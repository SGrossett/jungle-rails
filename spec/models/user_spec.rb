require 'rails_helper'

RSpec.describe User, type: :model do
  
  let(:user) { User.create(first_name: "Selene", last_name: "Grossett", email: "example@example.com", password: "password", password_confirmation: "password") }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid if the password and password_confirmation do not match' do
      @user = User.create(first_name: "Penny", last_name: "Proud", email: "example@example.com", password: "password", password_confirmation: "incorrect")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'is not valid without a password' do
      @user = User.create(first_name: "King", last_name: "Bob", email: "example@example.com", password_confirmation: "incorrect")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'is not valid without a password confirmation' do
      @user = User.create(first_name: "Ron", last_name: "Stopable", email: "example@example.com", password: "password")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'is not valid if the email is not unique' do
      @user = User.create(first_name: "Selene", last_name: "Grossett", email: "example@example.com", password: "password", password_confirmation: "password")
      @user2 = User.create(first_name: "Avatar", last_name: "Aang", email: "example@example.com", password: "password", password_confirmation: "password")
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'is not valid if the email is not unique, regardless of case' do
      @user = User.create(first_name: "Selene", last_name: "Grossett", email: "example@example.com", password: "password", password_confirmation: "password")
      @user2 = User.create(first_name: "Kim", last_name: "Possible", email: "EXAMPLE@EXAMPLE.com", password: "password", password_confirmation: "password")
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

     it 'is not valid without a email' do
      @user = User.create(first_name: "Tino", last_name: "Tonitini", password: "password", password_confirmation: "password")
      # user.email = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'is not valid without a first name' do
      @user = User.create(last_name: "Descartes", password: "password", email: "example@example.com", password_confirmation: "password")

      user.first_name = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'is not valid without a last name' do
      @user = User.create(first_name: "Randal", password: "password", email: "example@example.com", password_confirmation: "password")
      @user.last_name = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
  
    it 'is not valid if the password length is less than 8' do
      @user = User.create(first_name: "Steven", last_name: "Universe", email: "example@example.com", password: "eight", password_confirmation: "password")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end

    describe '.authenticate_with_credentials' do

    end
  end
end