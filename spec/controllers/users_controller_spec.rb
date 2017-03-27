require 'rails_helper'

describe UsersController do
    context 'Good Login Credientials' do
        describe '#login' do
            fixtures :users
            before :each do
                @user = users(:user_tmodell)
                @id = @user.id
                @name = @user.name
                @password = @user.password
            end
            it 'matches user input to database' do
               #expect(User).to receive(:find_by_name).with(@name).and_return(@user)
            end
            it 'looks up password' do
               #User.stub(:find_by_name).and_return(@user)
               #expect(@user).to receive(:password).and_return(@password) 
            end
        end
    end
    
end