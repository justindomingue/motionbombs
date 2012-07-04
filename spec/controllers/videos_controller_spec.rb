require 'spec_helper'

describe VideosController do
  describe "POST create" do
    let(:video) { mock_model(Video).as_null_object }
    
    before(:each) do
      Video.stub(:new).and_return(video)
      @params = {:video => { :title=>"Example title", :description=>"Description", :url=>"http://www.youtube.com/watch?v=b6speA_XhP4", :provider=>"youtube" }}
    end

    context 'when the video saves successfully' do
      before do
        video.stub(:save).and_return(true)
      end
      
      it "sets a flash[:notice] message" do
        post :create, @params
        flash[:notice].should eq("Video added successfully.")
      end
      
      it "redirects to the added video path" do
        post :create, @params
        video = assigns(:video)
        response.should redirect_to video_path(video)
      end
    end
    
    context 'when the video fails to save' do
      before(:each) do
        video.stub(:save).and_return(false)
      end
      
      it "assigns @video" do
        post :create, @params
        assigns[:video].should eq(video)
      end
      
      it "renders the new template" do
        post :create, @params
        response.should render_template("new")
      end
    end
  end
end
