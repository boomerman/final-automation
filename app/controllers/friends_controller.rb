class FriendsController < ApplicationController
  before_action :set_friend, only: :destroy

  def index
    @friends = current_user.friends
  end
  def destroy
  current_user.remove_friend(@friend)
  head :no_content
end
#def create
#friend = FriendRequest.find(params[:friendq])
#@friendship = current_user.friendships.new(friend_id: friend.friend_id, sender_roll: friend.sender_roll_no, friend_roll: friend.friend_roll_no)
 #   if @friendship.save
  #    render :show, status: :created, location: @friendship
  #  else
  #    render json: @friendship.errors, status: :unprocessable_entity
  #  end
#end


def create
    friend = FriendRequest.find(params[:friendq])
   
    @friend = current_user.friends.new(friend_id: friend.friend_id)

    if @friend.save
      render :show, status: :created, location: @friend
    else
      render json: @friend.errors, status: :unprocessable_entity
    end
  end
  private

  def set_friend
    @friend = current_user.friends.find(params[:id])
  end
end