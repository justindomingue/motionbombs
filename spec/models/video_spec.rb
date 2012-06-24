require 'spec_helper'

module VideoSpecHelper
  def valid_video_attributes
    { title:"Example", 
      description:"Long example for description", 
      thumb:"http://example.com/img.jpg", 
      url:"0973",
      provider_video_id:"H2L313M",
      provider:"Provider",
      views:0,
      likes:0 }    
  end
end

describe Video do
  include VideoSpecHelper
    
  before(:each) do
     @video = Video.new
  end
  
  it "should be valid" do
    @video.attributes = valid_video_attributes
    @video.should be_valid
  end
  
  it "should not be valid when title is empty" do
    @video.attributes = valid_video_attributes.except(:title)
    @video.should_not be_valid
    @video.should have(1).error_on(:title)
    @video.title = "Example"
    @video.should be_valid
  end
  
  it "should not be valid when title is more than 50 characters long" do
    @video.attributes = valid_video_attributes.except(:title)
    @video.title = "a"*51
    @video.should_not be_valid
    @video.should have(1).error_on(:title)
    @video.title = "a"*50
    @video.should be_valid
  end
  
  it "should not be valid when description is empty" do
    @video.attributes = valid_video_attributes.except(:description)
    @video.should_not be_valid
    @video.should have(1).error_on(:description)
    @video.description = "Example"
    @video.should be_valid
  end
  
  it "should not be valid when thumb is empty" do
    @video.attributes = valid_video_attributes.except(:thumb)
    @video.should_not be_valid
    @video.should have(2).error_on(:thumb)
    @video.thumb = "http://www.example.ca/img.jpg"
    @video.should be_valid
  end
  
  it "should be invalid when thumb is not a URL" do
    @video.attributes = valid_video_attributes.except(:thumb)
    @video.thumb = "aaa"
    @video.should_not be_valid
    @video.should have(1).error_on(:thumb)
    @video.thumb = "http://www.example.ca/img.jpg"
    @video.should be_valid
  end
  
  it "should not be valid when url is empty" do
    @video.attributes = valid_video_attributes.except(:url)
    @video.should_not be_valid
    @video.should have(2).error_on(:url)
    @video.url = "19292"
    @video.should be_valid
  end
  
  it "should not be valid when url is not numerical" do
    @video.attributes = valid_video_attributes.except(:url)
    @video.url = "a"
    @video.should_not be_valid
    @video.should have(1).error_on(:url)
    @video.url = "19292"
    @video.should be_valid
  end
  
  it "should not be valid when views is not numerical" do
    @video.attributes = valid_video_attributes.except(:views)
    @video.views = "a"
    @video.should_not be_valid
    @video.should have(1).error_on(:views)
    @video.views = "999"
    @video.should be_valid
  end
  
  describe 'methods to get the provider_video_id' do
    it "should return the right provider_video_id from VIMEO" do
      url = "http://www.vimeo.com/7592893"
      id = @video.get_vimeo_video_id(url)
      id.should == '7592893'
    end
  end  
  
  describe 'methods to get the provider_video_id' do
    it "should return the right provider_video_id from YOUTUBE" do
      url = "http://www.youtube.com/watch?v=T3UfQAGXSQM&feature=relmfu"
      id = @video.get_youtube_video_id(url)
      id.should == 'T3UfQAGXSQM'
    end
  end  
  
  
end
    
      