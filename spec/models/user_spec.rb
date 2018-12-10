require 'rails_helper'
 

RSpec.describe User, type: :model do
  before :each do 
    @user = User.new(
      first_name: 'Imbirdy',
      last_name: 'Dong',
      email: 'imbirdy@yahoo.com',
      password: 'ASDFGHJKLQWERTYUIO',
      password_confirmation: 'ASDFGHJKLQWERTYUIO'
    )
  end

  describe 'Validations' do
    
    it "is valid with valid attributes" do 
      expect(@user).to be_valid
    end

    it "should have a first_name" do
      @user.first_name = nil
      expect(@user).to be_invalid
    end

    it "should have a last_name" do
      @user.last_name = nil
      expect(@user).to be_invalid
    end

    it "should have a email" do
      @user.email = nil
      expect(@user).to be_invalid
    end
    
    it "should have a password_digest" do
      @user.password_digest = nil
      expect(@user).to be_invalid
    end

  end

  describe 'Password' do
    it "is only valid if confirm_password is the same" do
      differnt_user = User.new(
        first_name: 'Imbirdy',
        last_name: 'Dong',
        email: 'imbirdy@yahoo.com',
        password: 'Password1',
        password_confirmation: 'Password2'
      )
      expect(differnt_user).to be_invalid
    end
  
  
  end



end
