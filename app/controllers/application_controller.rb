class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :user_id

  def user_id
     @user = User.find(current_user.id) if
          user_signed_in?
  end
 

  private 

  def set_last_request_at 
    current_user.update_attribute(:last_request_at, Time.now) if 
	user_signed_in? 
  end 
end
