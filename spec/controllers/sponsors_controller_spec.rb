require 'spec_helper'

describe SponsorsController do
    describe 'new' do
        it 'should make a new Sponsor object' do
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
            @param = {name: 'IBM', email: 'ibm@ibm.com', info: 'cs169'}
        end
        it 'should make a new Sponsor object' do
            expect(Sponsor).to receive(:new).and_return(@sponsor)
            post :create, {sponsor: @param}
        end
        it 'should save it to the database' do
            expect{post :create, {sponsor: @param}}.to change{Sponsor.count}.by(1)
        end
        it 'should select the create template for rendering' do
            post :create, {sponsor: @param}
            expect(response).to render_template('create')
        end
    end
end