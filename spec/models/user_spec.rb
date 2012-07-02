require 'spec_helper'

describe User do
  before do
    @user = User.new(username:"Example", email:"email@domain.com", password:"foobar", password_confirmation:"foorbar")
  end
  
  subject { @user }
  
  it { should respond_to(:videos) }

end