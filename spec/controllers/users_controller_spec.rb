require 'spec_helper'

describe UsersController do
    describe 'login' do
        before :each do
            @test_user = FactoryGirl.create(:user)
        end
        context 'email exists' do
            it 'should ask the model to find a user with the entered email' do
                User.should_receive(:find_by).with(:email => 'rowan@funbun.com')
                post :login, {:user => {:email => 'rowan@funbun.com', :password => 'abc123'}}
            end
            context 'passwords match' do
                before :each do
                    User.stub(:find_by).with(:email => 'rowan@funbun.com').and_return(@test_user)
                    post :login, {:user => {:email => 'rowan@funbun.com', :password => 'abc123'}}
                end
                it 'should set the logged-in user in the session' do
                    session[:user].should == @test_user.id
                end
                it 'should notify the user they have logged in' do
                    flash[:notice].should == "Login successful."
                end
                it 'should redirect the user to the home page' do
                    response.should redirect_to('/')
                end
            end
            context 'passwords do not match' do 
                before :each do
                    User.stub(:find_by).with(:email => 'rowan@funbun.com').and_return(@test_user)
                    post :login, {:user => {:email => 'rowan@funbun.com', :password => 'wrong_password'}}
                end
                it 'should notify the user the password is incorrect' do
                    flash[:warning].should == 'Incorrect password.'
                end
                it 'should redirect to the login page' do
                    response.should redirect_to('/login')
                end
            end
        end
        context 'email does not exist' do 
            it 'should ask the model to find a user with the entered email' do
                User.should_receive(:find_by).with(:email => 'rowan@fake.com')
                post :login, {:user => {:email => 'rowan@fake.com', :password => 'abc123'}}
            end
            before :each do
                User.stub(:find_by).with(:email => 'rowan@fake.com')
                post :login, {:user => {:email => 'rowan@fake.com', :password => 'abc123'}}
            end
            it 'should set a warning that the user does not exist' do
                flash[:warning].should == 'Invalid email.'
            end
            it 'should redirect to the login page' do
                response.should redirect_to('/login')
            end
        end
    end
end
