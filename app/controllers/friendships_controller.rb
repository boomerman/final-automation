class FriendshipsController < ApplicationController
def index
end
def create
    friend = FriendRequest.find(params[:friendq])
    group = "G #{friend.user_id}#{friend.friend_id}"
    puts group
   new_records = [
   					{user_id: friend.user_id, friend_id:friend.friend_id, user_roll: friend.sender_roll_no, friend_roll: friend.friend_roll_no, group_id: group},
   					{user_id: friend.friend_id, friend_id:friend.user_id, user_roll: friend.friend_roll_no, friend_roll: friend.sender_roll_no, group_id: group}
   				]
@friendships = Friendship.create(new_records)
    if @friendships[0].save && @friendships[1].save
      render :show, status: :created, location: @friendship
 
    else
      render json: @friendship.errors, status: :unprocessable_entity
    end

  end
end
