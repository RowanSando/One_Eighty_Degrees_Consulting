require 'spec_helper'

describe Student do
    describe 'headers' do
        it 'should declare the e-mail headers' do
            student = FactoryGirl.build(:student)
            expected_result = {
            :subject => "My Contact Form",
            :to => "sandhu.rowan@gmail.com",
            :from => %("#{student.name}" <#{student.email}>)
            }
            result = student.headers
            expect(result).to eq(expected_result)
        end
    end
end