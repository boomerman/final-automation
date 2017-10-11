class FriendshipsController < ApplicationController
def index
end
def create
    friend = FriendRequest.find(params[:friendq])
   
    @friendship = current_user.friendships.new(friend_id: friend.user_id, user_roll: friend.friend_roll_no, friend_roll: friend.sender_roll_no)

    if @friendship.save
      render :show, status: :created, location: @friendship
    else
      render json: @friendship.errors, status: :unprocessable_entity
    end
  end
end
