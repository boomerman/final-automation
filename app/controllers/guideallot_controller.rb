class GuideallotController < ApplicationController
	before_action :coordinator_only
  def allotment
  	@groups = Friendship.all
  end
  private
  def coordinator_only
    unless current_user.coordinator? || current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
 end
  
end
