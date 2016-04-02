require 'spec_helper'

describe StudentsController do
    describe 'new' do
        it 'should make a new Student object' do
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
            @param = {name: 'Rowan', email: 'rowan@funbun.com', major: 'EECS', graduation: '2016', info: 'cs169'}
        end
        it 'should make a new Student object' do
            expect(Student).to receive(:new).and_return(@student)
            post :create, {student: @param}
        end
        it 'should save it to the database' do
            expect{post :create, {student: @param}}.to change{Student.count}.by(1)
        end
        it 'should select the create template for rendering' do
            post :create, {student: @param}
            expect(response).to render_template('create')
        end
    end
end