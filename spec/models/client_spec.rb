require 'spec_helper'

describe Client do
    describe 'headers' do
        it 'should declare the e-mail headers' do
            client = FactoryGirl.build(:client)
            expected_result = {
            :subject => "My Contact Form",
            :to => "sandhu.rowan@gmail.com",
            :from => %("#{client.name}" <#{client.email}>)
            }
            result = client.headers
            expect(result).to eq(expected_result)
        end
    end
end