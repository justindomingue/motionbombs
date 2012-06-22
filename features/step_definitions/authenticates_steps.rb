Given /^I am on the login page$/ do
  visit login_path
end

Then /^I should see "(.*?)"$/ do |text|
  page.has_content?(text)
end

When /^I fill the login form uncorrectly$/ do
  fill_in 'Username', :with => 'Wrong user'
  fill_in 'Password', :with => 'Wrong password'
  click_button 'Log in'
end

When /^I fill the login form correctly$/ do
  fill_in 'Username', :with => 'Example'
  fill_in 'Password', :with => 'password'
  click_button 'Log in'
end

Then /^I should be on login$/ do
  current_path.should == login_path
end

Then /^I should be on root$/ do
  current_path.should == root_path
end

Given /^I am registered$/ do
  @user = User.create!(:username => 'Example', :email => 'example@domain.com', :password => 'password', :password_confirmation => 'password')
end