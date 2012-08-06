Given /^I have not visited a video$/ do
end

When /^I visit its path$/ do
  visit video_path(1)
end

Then /^the view count increments$/ do
  
end

Given /^I have already visited a video$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I visit its path again$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the view count does not increments$/ do
  pending # express the regexp above with the code you wish you had
end

