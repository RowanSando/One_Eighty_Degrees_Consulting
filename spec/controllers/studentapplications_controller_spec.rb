# require 'spec_helper'


# describe StudentapplicationsController do
#     before :each do
#         @request.env["devise.mapping"] = Devise.mappings[:user]
#         user = FactoryGirl.create(:user)
#         sign_in user
#     end
#     describe 'new' do
#         it 'should make a new Student object' do
#             expect(Studentapplication).to receive(:new)
#             get :new
#         end
#         it 'should select the new template for rendering' do
#             get :new
#             expect(response).to render_template('new')
#         end
#     end
#     describe 'create' do
#         before :each do
#             @student = FactoryGirl.build(:studentapplication)
#             @param = {name: 'Rowan', email: 'rowan@funbun.com', major: 'EECS', graduation: '2016', info: 'cs169'}
#         end
#         it 'should make a new Student object' do
#             expect(Studentapplication).to receive(:new).and_return(@student)
#             post :create, {studentapplication: @param}
#         end
#         it 'should save it to the database' do
#             expect{post :create, {studentapplication: @param}}.to change{Studentapplication.count}.by(1)
#         end
#         it 'should select the create template for rendering' do
#             post :create, {studentapplication: @param}
#             expect(response).to render_template('create')
#         end
#     end
# end