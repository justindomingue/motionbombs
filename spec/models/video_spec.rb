
module VideoSpecHelper
  def valid_video_attributes
    { title:"Example", 
      description:"Long example for description", 
      thumb:"http://example.com/img.jpg", 
      provider_video_id:"H2L313M",
      provider:"Provider",
      views:0,
      likes:0 
    }    
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
  
  it "should not be valid when views is not numerical" do
    @video.attributes = valid_video_attributes.except(:views)
    @video.views = "a"
    @video.should_not be_valid
    @video.should have(1).error_on(:views)
    @video.views = "999"
    @video.should be_valid
  end
  
  describe "association to User" do
    let(:user) { FactoryGirl.create(:user) }
    before { @video = user.videos.build(title:'Example') }
    
    subject { @video }
    
    it { should respond_to(:title) }
    it { should respond_to(:description) }
    it { should respond_to(:user_id) }
    it { should respond_to(:user) }
    its(:user) { should == user }
    
    describe "when user_id is not present" do
      before { @video.user_id = nil }
      it { should_not be_valid }
    end
    
    describe "when category_id is not present" do
      before { @video.category_id = nil }
      it { should_not be_valid }
    end
  end
end
    
      