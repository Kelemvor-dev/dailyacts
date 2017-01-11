class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
      @user = User.find(current_user.id)
      @users = User.where.not("id = ?",current_user.id).order("first_name ASC")       
  end
  def show
    @profiles = User.where("id in (select friend_id from friend_requests where user_id=?) and id not in (?)",current_user,current_user).order("first_name ASC")
  	@user_profile = User.find(params[:id])  
  	respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @user }
    end	
  end
end
