require 'spec_helper'

describe Like do
  let(:user) { FactoryGirl.create(:user) }
  before { @like = user.likes.build(video_id:'1') }
  
  subject { @like }
  it { should respond_to(:user)}
  it { should respond_to(:video)}
  
  describe 'without a user_id' do
    before{@like.user_id = nil}
    it { should_not be_valid }
  end
  
  describe 'without a video_id' do
    before{@like.video_id = nil}
    it { should_not be_valid }
  end
  
end
