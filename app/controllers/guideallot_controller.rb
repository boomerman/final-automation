class GuideallotController < ApplicationController
  def allotment
  	@groups = Friendship.all
  end
  def update
  	@guide = .find(params[:group_id])
    if @team.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
end
