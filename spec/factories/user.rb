FactoryGirl.define do
  factory :user do
    email "admin@berkeley.com"
    password "password123"
    member_type "admin"
  end
end