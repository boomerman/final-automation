class FriendRequestsController < ApplicationController
	 before_action :set_friend_request, except: [:index, :create]
before_action :student_only
  def create

    friend = User.find(params[:friend_id])
   
    @friend_request = current_user.friend_requests.new(friend: friend, friend_roll_no: friend.college_roll, sender_roll_no: current_user.college_roll)

    if @friend_request.save
      render :show, status: :created, location: @friend_request
    else
      render json: @friend_request.errors, status: :unprocessable_entity
    end
  end
   def show
   end 
  def destroy
  @friendship = current_user.friend_requests.find(params[:id])
  @friendship.destroy
  flash[:notice] = "Removed friendship."
  redirect_to root_url
end

private
  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end
  def student_only
    unless current_user.student? || current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
 end
end


