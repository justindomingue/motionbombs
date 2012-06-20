Given /^I am on the register page$/ do
  visit signup_path
end

When /^I fill the register form uncorrectly$/ do
  fill_in 'Username', :with => ''
  fill_in 'Email', :with => 'example'
  fill_in 'Password', :with => 'ex'
  fill_in 'Password confirmation', :with => 'exampl'
  click_button 'Register'
end

When /^I fill the register form correctly$/ do
  fill_in 'Username', :with => 'Example'
  fill_in 'Email', :with => 'example@domain.com'
  fill_in 'Password', :with => 'example'
  fill_in 'Password confirmation', :with => 'example'
  click_button 'Register'
end

Then /^I should be on register$/ do
  current_path.should == signup_path
end
