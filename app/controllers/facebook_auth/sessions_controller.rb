module FacebookAuth
  class SessionsController < ApplicationController
    
    skip_before_filter :authenticate!
    
    def create
      @user = ::User.find_or_create_from_auth_hash(auth_hash)
      self.current_user = @user
      redirect_to return_to
    end
    
    def destroy
      reset_session
      redirect_to "/"
    end

    protected

    def auth_hash
      request.env['omniauth.auth']
    end
  end
end