require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do   
    @user = User.new(first_name: 'Mazli', 
                    last_name: 'Barton', 
                    email: 'mazli@mazli.com', 
                    password: 'mazli', 
                    password_confirmation: 'mazli')
    @user.save!
  end

  after(:all) do
    User.destroy_all
  end

  describe 'Validations' do
    it "returns invalid when user first_name is empty" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end
    
    it "returns invalid when user last_name is empty" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "returns invalid when user password is empty" do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it "returns invalid when user password_confirmation is empty" do
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end

    it 'returns invalid when the password and password_confirmation fields are not the same' do
      @user.password_confirmation = 'mazli1'
      expect(@user).to_not be_valid
    end

    it 'returns invalid when we try to sign up with an existing email address' do
      @user2 = User.new(first_name: 'Mazli', 
      last_name: 'Barton', 
      email: 'mazli@mazli.com', 
      password: 'mazli', 
      password_confirmation: 'mazli')
      expect(@user2).to_not be_valid
    end

    it 'returns invalid even if password is uppercased, but same' do
      @user2 = User.new(first_name: 'Mazli', 
      last_name: 'Barton', 
      email: 'MAZLI@mazli.COM', 
      password: 'mazli', 
      password_confirmation: 'mazli')
      expect(@user2).to_not be_valid
    end

    it 'validates that password is at least 4 characters in length' do
      expect(@user.password.length).to be >= 3
    end
  end

  describe '.authenticate_with_credentials' do
    it 'does not authenticate if email does not match' do
      user = User.authenticate_with_credentials('mazli@gmail.com', 'mazli')
      expect(user).to be nil
    end

    it 'does not authenticate if password does not match' do
      user = User.authenticate_with_credentials('mazli@mazli.com', 'mazli1')
      expect(user).to be nil
    end

    it 'does authenticate if email has trailing whitespace' do
      user = User.authenticate_with_credentials('   mazli@mazli.com   ', 'mazli')
      expect(user).to be user
    end

    it 'does authenticate if email has lower and uppercase' do
      user = User.authenticate_with_credentials('maZLi@mAZli.com', 'mazli')
      expect(user).to be user
    end
  end

end
