require 'rails_helper'
 

RSpec.describe User, type: :model do
  before :each do 
    @user = User.new(
      first_name: 'Imbirdy',
      last_name: 'Dong',
      email: 'imbirdy@yahoo.com',
      password: '1234567',
      password_confirmation: '1234567'
    )
  end
  describe 'Validations: ' do
    context "A new User" do
    
      it 'is valid with valid attributes' do 
        expect(@user).to be_valid
      end
  
      it 'should have a first_name' do
        @user.first_name = nil
        expect(@user).to be_invalid
      end
  
      it 'should have a last_name' do
        @user.last_name = nil
        expect(@user).to be_invalid
      end
  
      it 'should have a email' do
        @user.email = nil
        expect(@user).to be_invalid
      end
      
      it 'should have a password_digest' do
        @user.password_digest = nil
        expect(@user).to be_invalid
      end
    end

    context 'Password' do
      
      it 'is only valid if confirm_password is the same' do
        differnt_user1 = User.new(
          first_name: 'Imbirdy',
          last_name: 'Dong',
          email: 'imbirdy@yahoo.com',
          password: 'Password1',
          password_confirmation: 'Password2'
        )
        expect(differnt_user1).to be_invalid
      end
    end 
    
    context 'Email' do
     it 'is not registered by other users' do
       @user.save
       differnt_user2 = User.new(
         first_name: 'Imbirdy',
         last_name: 'Joke',
         email: 'imbirdy@yahoo.com',
         password: 'Password1',
         password_confirmation: 'Password1'
       )

       expect(differnt_user2).to be_invalid
     end
    end
  end

  describe '.authenticate_with_credentials' do


    it 'should return the user instance if the credentials match' do
      
    @user = User.find_by(id: 2)
      login_user = User.authenticate_with_credentials('imbirdy@yahoo.com','1234567')
      expect(login_user).to match @user
    end 

    it 'should return nil if the credentials dont match' do
      login_user = User.authenticate_with_credentials('jajabinx@yahoo.com','Password2')
      expect(login_user).to match nil
    end
  end

   


  


end
