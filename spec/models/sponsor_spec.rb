require 'spec_helper'

describe Sponsor do
    describe 'headers' do
        it 'should declare the e-mail headers' do
            sponsor = FactoryGirl.build(:sponsor)
            expected_result = {
            :subject => "My Contact Form",
            :to => "sandhu.rowan@gmail.com",
            :from => %("#{sponsor.name}" <#{sponsor.email}>)
            }
            result = sponsor.headers
            expect(result).to eq(expected_result)
        end
    end
end