require 'spec_helper'

describe "Pages" do
  describe "GET /" do
    it "has the right title" do
      visit '/'
      page.should have_selector('title', :text => 'Home | Motion Bombs')
    end
  end
  
  describe "GET /pages/about" do
    it "has the right title" do
      visit '/pages/about'
      page.should have_selector('title', :text => 'About | Motion Bombs')
    end
  end
  
  describe "GET /help" do
    it "has the right title" do
      visit '/help'
      page.should have_selector('title', :text => 'Help | Motion Bombs')
    end
  end
end
