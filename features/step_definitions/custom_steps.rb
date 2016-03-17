Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    User.create(user)
  end
end

Given /^(?:|I )am( not)? logged in(.*)/ do |status, access|
  pending
  # if status
  #   session[:id].should == ""
  # else
  #   session[:id].should_not == ""
  # end
end

# Given /^(?:|I )am logged into the admin panel/ do
#   pending
# end