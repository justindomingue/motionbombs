Given /^I am logged in$/ do
  visit login_path
  fill_in 'username', with:'example'
  fill_in 'password', with:'password'
  click_link 'Log in'
end

Given /^a video exists$/ do
  @video = Video.find(1)
  visit video_path @video
end

Given /^I don't like it$/ do
  current_user.likes?(@video.id) == false
end

When /^I click "(.*?)"$/ do |link|
  click_link link
end

Then /^I should like it$/ do
  current_user.likes(@video.id) == true
end

Given /^I like it$/ do
  current_user.likes?(@video.id) == true
end

Then /^I should not like it$/ do
  current_user.likes?(@video.id) == false
end
