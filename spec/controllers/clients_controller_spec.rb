require 'spec_helper'

describe ClientsController do
    describe 'new' do
        it 'should create a new Client object' do
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
        end
        it 'should create a new Client object' do
            expect(Client).to receive(:new).and_return(@client)
            post :create
        end
        before :each do
            allow(Client).to receive(:new).and_return(@client)
        end
        context 'mail is succcesfully delivered' do
            it 'should select the create template for rendering' do
                allow(@client).to receive(:deliver).and_return(true)
                post :create
                expect(response).to render_template('create')
            end
        end
        context 'mail is not delivered' do
            it 'should select the new template for rendering' do
                allow(@client).to receive(:deliver).and_return(false)
                post :create
                expect(response).to render_template('new')
            end
        end
    end
end