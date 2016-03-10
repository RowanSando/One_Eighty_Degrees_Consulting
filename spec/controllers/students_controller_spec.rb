require 'spec_helper'

describe StudentsController do
    describe 'new' do
        it 'should create a new Student object' do
            expect(Student).to receive(:new)
            get :new
        end
        it 'should select the new template for rendering' do
            get :new
            expect(response).to render_template('new')
        end
    end
    describe 'create' do
        before :each do
            @student = FactoryGirl.build(:student)
        end
        it 'should create a new Student object' do
            expect(Student).to receive(:new).and_return(@student)
            post :create
        end
        before :each do
            allow(Student).to receive(:new).and_return(@student)
        end
        context 'mail is succcesfully delivered' do
            it 'should select the create template for rendering' do
                allow(@student).to receive(:deliver).and_return(true)
                post :create
                expect(response).to render_template('create')
            end
        end
        context 'mail is not delivered' do
            it 'should select the new template for rendering' do
                allow(@student).to receive(:deliver).and_return(false)
                post :create
                expect(response).to render_template('new')
            end
        end
    end
end