class FriendRequestsController < ApplicationController
	 before_action :set_friend_request, except: [:index, :create]

  def create
    friend = User.find(params[:friend_id])
   
    @friend_request = current_user.friend_requests.new(friend: friend, friend_roll_no: friend.college_roll, sender_roll_no: current_user.college_roll)

    if @friend_request.save
      render :show, status: :created, location: @friend_request
    else
      render json: @friend_request.errors, status: :unprocessable_entity
    end
  end
  #def update
  #accept = FriendRequest.find[:friend_request_id].update_attributes(:accepted => "true", :pending =>"false")
  #end
 # def updatefs
     #friend = User.find(params[:id])
   # @friend_request = current_user.friend_requests.find(friend_id: friend)
  #@friend_request.accept
 # head :no_content
  #redirect_to: root
  #update_attributes(:accepted=>'true', :pending=>'false')

 # end
  
  private

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end

end
