require 'spec_helper'

describe FacebookAuth::SessionsController do

  describe "GET 'create'" do
    # it "should redirect to return_to" do
    # end
  end
  
  describe "DELETE 'destroy'" do
    it "should clear session" do
      subject.should_receive(:reset_session)
      delete :destroy
    end
    
    it "should redirect to /" do
      delete :destroy
      response.should redirect_to("/")
    end
  end

end
