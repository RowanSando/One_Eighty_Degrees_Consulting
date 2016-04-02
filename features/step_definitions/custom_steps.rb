Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    User.create(user)
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