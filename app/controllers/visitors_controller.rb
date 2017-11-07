class VisitorsController < ApplicationController
before_action :student_only, except: [:index,:teacher, :coordinator]
before_action :teacher_only, except: [:index, :student, :coordinator]
before_action :coordinator_only, except: [:index, :teacher, :student]
#before_action :check_for_friendship
	def index
		@dosts = Friendship.where(user_id: current_user).first
		@users = User.all
  @incomings = FriendRequest.where(friend: current_user)
  @outgoings = FriendRequest.where(user: current_user)

end
def student
end
def teacher
  @panels = Panel.all
  @groups= Friendship.where(guide: current_user.college_roll)
end
def coordinator

end
private
def check_for_friendship
 if Friendship.exists?(user_id: current_user)
  redirect_to project_corner_url
end
end
def student_only
    unless current_user.student? || current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
 end
def coordinator_only
    unless current_user.coordinator? || current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
 end
 def teacher_only
    unless current_user.guide? || current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
 end

end
