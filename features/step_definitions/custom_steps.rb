# Create Users Table for testing
Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    u = User.create(user)
    u.confirmed_at = Time.now
    u.save
  end
end

# Create Students Table for testing
Given /the following applications exist/ do |applications_table|
  applications_table.hashes.each do |application|
    # Studentapplication.create(application)
    @name = application[:name]
    @email = application[:email]
    application.delete("name")
    application.delete("email")
    new_hash = Hash["name", @name, "email", @email]
    user = FactoryGirl.create(:user, new_hash)
    user.confirmed_at = Time.now
    application[:user_id] = user.id
    FactoryGirl.create(:studentapplication, application)
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


Then /^(?:|I )should( not)? see the (.*) for (.*) as "([^"]*)"?/ do |should_not, field, user, value|
  if should_not
    find(:xpath, "//tr[contains(.,#{user})]/td[@class=#{field}]").text.should_not == value
  else
    find(:xpath, "//tr[contains(.,#{user})]/td[@class=#{field}]").text.should == value
  end
end

Then /^(?:|I )select(?:| the) checkbox for (.*)?/ do |user|
  find(:xpath, "//tr[contains(.,#{user})]/td/input").set(true)
end

Then /^(?:|I )should( not)? see a (.*) file/ do |file_type|
  pending
end

Given /^the user "(.*?)" has the application "(.*?)"$/ do |user, app|
  User.find(user).studentapplication = Studentapplication.find(app)
end

When /^(?:|I )follow (.*) for (.*)$/ do |link, user|
   find(:xpath, "//tr[contains(.,#{user})]/td/a[contains(.,#{link})]").click
end

Given /^the deadline is "(.*)"$/ do |deadline|
  # require 'date'
  Deadline.create("date" => DateTime.parse(deadline))
end

When /^(?:|I ) fill in date with "(.*)"$/ do |value|
  value = Datetime.new(value.split('-'))
  fill_in(field, :with => value)
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  
  # page.should have_css('.login')
  if link.downcase == "login"
    find('#login', visible: false).click
  elsif link.downcase == "about"
    find('#about', visible: false).click
  elsif link.downcase == "logout"
    find('#logout', visible: false).click
  elsif link.downcase == "teams"
    find('#teams', visible: false).click
  elsif link.downcase == "apps"
    find('#apps', visible: false).click
  elsif link.downcase == "admin"
    find('#admin', visible: false).click
  else
    # find('#home', visible:false).click
    click_link(link)
  end
end