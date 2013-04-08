module AuthHelpers
  extend ActiveSupport::Concern
  
  included do
    helper_method :current_user, :current_user=, :user_signed_in?,
      :authenticate!
    hide_action :current_user, :current_user=, :user_signed_in?,
      :authenticate!, :store_location, :request_url
  end
  
  protected
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def current_user=(user)
    session[:user_id] = user.id
  end
  
  def user_signed_in?
    session.has_key? :user_id
  end
  
  def authenticate!
    unless user_signed_in?
      store_location
      redirect_to("/auth/facebook")
    end
  end
  
  def request_url
    puts request.url
    case request.url
    when nil, "/auth/facebook"
      "/"
    else
      request.url
    end      
  end
  
  def store_location
    session[:return_to] = request_url
  end
  
  def return_to
    session[:return_to] || "/"
  end

end