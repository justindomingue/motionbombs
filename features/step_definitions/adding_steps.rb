Given /^I am on the add video page$/ do
  visit new_video_path
end

When /^I fill in the form$/ do
  fill_in 'Title', with:'Title of the video'
  fill_in 'Description', with:'This is a description.'
  fill_in 'video_url', with:'http://www.youtube.com/watch?v=EuSNbih9mAc&feature=g-logo-xit'
  choose 'video_provider_youtube'
  click_button 'Add video'
end

Then /^I should see 'Video added'$/ do
  page.has_content?('Video added')
end

Then /^I should be on the new video page$/ do
  @video = Video.find_by_title('Title of the video')
  current_path.should == video_path(@video)
end
