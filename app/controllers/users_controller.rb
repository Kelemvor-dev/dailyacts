class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
      @user = User.find(current_user.id)
      @users = User.where.not("id = ?",current_user.id).order("first_name ASC") 
      @outgoing = current_user.friend_requests           
  end
  def show
  	@user_profile = User.find(params[:id])  
  	respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @user }
    end	
  end
end
