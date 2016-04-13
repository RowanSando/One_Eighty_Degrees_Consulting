# Create Users Table for testing
Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create(user)
  end
end

# Create Students Table for testing
Given /the following students exist/ do |students_table|
  students_table.hashes.each do |student|
    Student.create(student)
  end
end

# Create Clients Table for testing
Given /the following clients exist/ do |clients_table|
  clients_table.hashes.each do |client|
    Client.create(client)
  end
end

# Create Sponsors Table for testing
Given /the following sponsors exist/ do |users_table|
  users_table.hashes.each do |sponsor|
    Sponsor.create(sponsor)
  end
end

Given /^(?:|I )am( not)? logged in(.*)?/ do |status, access|
  pending
  # if status
  #   step "I should not see 'signed in as'"
  # else
  #   @user = Factory(:user, :email => 'rowan@funbun.com', :password => 'password123')
  #   # @admin = Factory(:user, :email => 'admin@funbun.com', :password => 'password123', :member_type => 'admin')
  #   visit('/users/sign_in')
  #   fill_in('Email', :with => @user.email)
  #   fill_in('Password', :with => @user.password)
  #   click_button('Log in')
  #   step "I should see 'signed in as'"
  # end
end

# Given /^(?:|I )am logged into the admin panel/ do
#   pending
# end

Given /^"(.*)" is accepted/ do |user|
  pending
end

Given /^"(.*)" is rejected/ do |user|
  pending
end

Then /^(?:|I )should( not)? see the (.*) for (.*) as (.*)?/ do |should_not, field, user, value|
  pending
end

Then /^(?:|I )select( the)? checkbox for (.*)?/ do |user|
  pending
end

Then /^(?:|I )should( not)? see a (.*) file/ do |file_type|
  pending
end