require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'creates a new user with valid params' do
      @user = User.create(
        name: 'Johnny Dough',
        email: 'johnny@dough.ca',
        password: 'hunter2',
        password_confirmation: 'hunter2'
        )
        expect(@user).to be_valid
    end

    it 'fails to create a new user with unequal passwords' do
      @user = User.create(
        name: 'Johnny Dough',
        email: 'johnny@dough.ca',
        password: 'hunter2',
        password_confirmation: 'hunter3'
        )
        @user.should_not be_valid
    end

    it 'fails to create a new user with an empty password field' do
      @user = User.create(name: 'Johnny Dough', email: 'johnny@dough.ca')
      @user.should_not be_valid
    end
  end

end
