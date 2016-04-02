require 'spec_helper'

describe ClientsController do
    describe 'new' do
        it 'should make a new Client object' do
            expect(Client).to receive(:new)
            get :new
        end
        it 'should select the new template for rendering' do
            get :new
            expect(response).to render_template('new')
        end
    end
    describe 'create' do
        before :each do
            @client = FactoryGirl.build(:client)
            @param = {name: 'UNICEF', email: 'unicef@unicef.com', info: 'cs169'}
        end
        it 'should make a new Client object' do
            expect(Client).to receive(:new).and_return(@client)
            post :create, {client: @param}
        end
        it 'should save it to the database' do
            expect{post :create, {client: @param}}.to change{Client.count}.by(1)
        end
        it 'should select the create template for rendering' do
            post :create, {client: @param}
            expect(response).to render_template('create')
        end
    end
end