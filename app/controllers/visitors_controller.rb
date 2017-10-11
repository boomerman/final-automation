class VisitorsController < ApplicationController
	def index
		@users = User.all
  @incomings = FriendRequest.where(friend: current_user)
  @outgoings = FriendRequest.where(user: current_user)
end
end
