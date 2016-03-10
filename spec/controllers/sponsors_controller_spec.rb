require 'spec_helper'

describe SponsorsController do
    describe 'new' do
        it 'should create a new sponsor object' do
            expect(Sponsor).to receive(:new)
            get :new
        end
        it 'should select the new template for rendering' do
            get :new
            expect(response).to render_template('new')
        end
    end
    describe 'create' do
        before :each do
            @sponsor = FactoryGirl.build(:sponsor)
        end
        it 'should create a new Sponsor object' do
            expect(Sponsor).to receive(:new).and_return(@sponsor)
            post :create
        end
        before :each do
            allow(Sponsor).to receive(:new).and_return(@sponsor)
        end
        context 'mail is succcesfully delivered' do
            it 'should select the create template for rendering' do
                allow(@sponsor).to receive(:deliver).and_return(true)
                post :create
                expect(response).to render_template('create')
            end
        end
        context 'mail is not delivered' do
            it 'should select the new template for rendering' do
                allow(@sponsor).to receive(:deliver).and_return(false)
                post :create
                expect(response).to render_template('new')
            end
        end
    end
end