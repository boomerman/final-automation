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
Team.create(group_id: group)
  end
  def update
   # @guide = params[:guide]
    @group = Friendship.find(params[:id])
a = @group.group_id

puts a
@groupq = Friendship.where(group_id: a)
 
    if @groupq[0].update_attributes(secure_params) && @groupq[1].update_attributes(secure_params) #&& @groupq.update_attributes(secure_params)
      redirect_to guideallot_allotment_path, :notice => "guide updated."
    else
      redirect_to guideallot_allotment_path, :alert => "Unable to update guide."
    end
  end
  private
  def secure_params
    params.require(:friendship).permit(:guide)

  end
end
 