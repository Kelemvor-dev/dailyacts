class FriendRequestsController < ApplicationController
	before_action :set_friend_request, except: [:index, :create]
	before_action :set_friend, only: :destroy

	def index
	   @users = User.where("id NOT in (select friend_id from friend_requests where user_id=?) and id not in (?)",current_user,current_user).order("first_name ASC")
	end

	def create
		friend = User.find(params[:id])
		@friend_request = current_user.friend_requests.new(friend: friend)

		if @friend_request.save
		  redirect_to '/friend_requests'
		else
		  render json: @friend_request.errors, status: :unprocessable_entity
		end
	end

	def update
	  @friend_request.accept
	  head :no_content
	end

  private

  def set_friend
    @friend = current_user.friends.find(params[:id])
  end

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end
end

