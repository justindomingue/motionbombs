require 'spec_helper'

describe Category do
  before do
    @category = Category.create(name:'human', description:'just a normal category')
  end
    
  subject { @category }
    
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:videos) }
  
  it { should be_valid }
  
  describe "when name is too short" do
    before { @category.name = "a" }
    it { should_not be_valid }
  end
  describe "when name is too long" do
    before { @category.name = "a"*51 }
    it { should_not be_valid }
  end
  
  describe "when description is too long" do
    before { @category.description = "a"*151 }
    it { should_not be_valid }
  end
  describe "when description is too short" do
    before { @category.description = "a" }
    it { should_not be_valid }
  end
end
