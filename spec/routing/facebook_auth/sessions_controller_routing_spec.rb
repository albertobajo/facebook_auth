require 'spec_helper'

describe FacebookAuth::SessionsController do
  it { get("/auth/facebook/callback").should route_to("facebook_auth/sessions#create") }
  it { delete("/auth/facebook/logout").should route_to("facebook_auth/sessions#destroy") }
end