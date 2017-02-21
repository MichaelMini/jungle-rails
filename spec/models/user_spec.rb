require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before(:each) do

      @user12 = User.create( first_name: 'Michael', last_name: 'Cho', email: 'michael@gmail.com', password: '80008000', password_confirmation: '80008000')

    end

    context "password" do

      it "user password must be more than 8 characters" do
        @user14 = User.create( first_name: 'Michael3', last_name: 'Cho3', email: 'michaels@gmail.com', password: '8000800', password_confirmation: '8000800')
        expect(@user14.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
      end

      it "user password must be present" do
        @user12.password = nil
        @user12.save
        expect(@user12.errors.full_messages).to include("Password can't be blank")
      end

      it "user password confirmation must be present" do
        @user12.password_confirmation = nil
        @user12.save
        expect(@user12.errors.full_messages).to include("Password confirmation can't be blank")
      end

    end

    context "presence" do

      it "user email must be present" do
        @user12.email = nil
        @user12.save
        expect(@user12.errors.full_messages).to include("Email can't be blank")
      end

      it "user first name must be present" do
        @user12.first_name = nil
        @user12.save
        expect(@user12.errors.full_messages).to include("First name can't be blank")
      end

      it "user email must be present" do
        @user12.last_name = nil
        @user12.save
        expect(@user12.errors.full_messages).to include("Last name can't be blank")
      end

    end

    context "uniqueness" do
      it "email must be case insensitive" do
        @user12.save
        @user13 = User.create({
          first_name: 'Michael2',
          last_name: 'Cho2',
          email: 'MIchael@gmail.com',
          password: '80009000',
          password_confirmation: '80009000'
        })
        expect(@user13.errors.full_messages).to include("Email has already been taken")
      end
    end

    after(:each) do
      User.where(first_name: 'Michael').destroy_all
    end

  end
  describe '.authenticate_with_credentials' do

    before(:each) do
      @user12 = User.create( first_name: 'Michael', last_name: 'Cho', email: 'michael@gmail.com', password: '80008000', password_confirmation: '80008000')
    end

    it "Login with white-space" do
      user = User.authenticate_with_credentials(" michael@gmail.com ", "80008000")
      expect(user).to be_instance_of(User)
    end

    it "Login with mix-case" do
      user = User.authenticate_with_credentials("MicHael@Gmail.Com", "80008000")
      expect(user).to be_instance_of(User)
    end

    after(:each) do
      User.where(first_name: 'Michael').destroy_all
    end

  end
end
