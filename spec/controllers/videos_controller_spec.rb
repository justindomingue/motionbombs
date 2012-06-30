require 'spec_helper'

describe VideosController do
  describe "POST create" do
    let(:video) { mock_model(Video).as_null_object }
    
    before do
      Video.stub(:new).and_return(video)
    end
    
    context 'when the video saves successfully' do
      before do
        video.stub(:save).and_return(true)
      end
      
      it "sets a flash[:notice] message" do
        post :create
        flash[:notice].should eq("Video added successfully.")
      end
      
      it "redirects to the added video path" do
        post :create
        response.should redirect_to(video_path('1'))
      end
    end
    
    context 'when the video fails to save' do
      before do
        video.stub(:save).and_return(false)
      end
      
      it "assigns @video" do
        post :create
        assigns[:video].should eq(video)
      end
      
      it "renders the new template" do
        post :create
        response.should render_template("new")
      end
    end
  end
end
