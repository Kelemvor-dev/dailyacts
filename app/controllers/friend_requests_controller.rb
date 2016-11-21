class FriendRequestsController < ApplicationController
	before_action :set_friend_request, except: [:index, :create]
	before_action :set_friend, only: :destroy

	 def index
	   @friends = current_user.friends
	 end

	def create
		friend = User.find(params[:id])
		@friend_request = current_user.friend_requests.new(friend: friend)

		if @friend_request.save
		  redirect_to "/home" 
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

