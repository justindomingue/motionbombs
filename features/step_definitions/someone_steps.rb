Given /^I am on the help page$/ do
  visit help_path
end

When /^I fill the contact form$/ do
  @name = "Jean Valjean"
  @email = "example@domain.com"
  @message = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vulputate lacinia mi, eu vestibulum nisi."
  fill_in "Name", :with => @name
  fill_in "Email*", :with => @email
  fill_in "Message*", :with => @message
  click_button "I need help!"
end

Then /^I create a new help ticket$/ do
  ticket = Help.find_by_name(@name)
  ticket.email == @email
  ticket.message == @message
end
  