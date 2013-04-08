require 'spec_helper'

describe AuthHelpers do
  
  class FooController < ActionController::Base
    extend AuthHelpers
  end
  
  subject { FooController.new }
    
  describe "user_signed_in?" do
    it "should return true if user is authenticated" do
      subject.stub!(:session).and_return({ user_id: "33" })
      subject.send(:user_signed_in?).should be_true
    end
    
    it "should return false if user is not authenticated" do
      subject.stub!(:session).and_return(Hash.new)
      subject.send(:user_signed_in?).should be_false
    end
  end
  
  describe "authenticate!" do
    context "user is not authenticated" do
      before(:each) do
        subject.stub!(:session).and_return(Hash.new)
        subject.stub!(:redirect_to)
        subject.stub_chain(:request, :url).and_return("/foo/bar")
      end
      
      it "should redirect to /auth/facebook" do
        subject.should_receive(:redirect_to).with("/auth/facebook")
        subject.send(:authenticate!)
      end
      
      it "should store location" do
        subject.should_receive(:store_location)
        subject.send(:authenticate!)
      end
    end
  end
  
  describe "request_url" do
    it "should return / if request.url is /auth/facebook" do
      subject.stub_chain(:request, :url).and_return("/auth/facebook")
      subject.send(:request_url).should eq("/")
    end
    
    it "should return / if request.url is nil" do
      subject.stub_chain(:request, :url).and_return(nil)
      subject.send(:request_url).should eq("/")
    end
    
    it "should return request.url" do
      subject.stub_chain(:request, :url).and_return("/foo")
      subject.send(:request_url).should eq("/foo")
    end
  end
end