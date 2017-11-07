class GuideallotController < ApplicationController
  def allotment
  	@groups = Friendship.all
  end
  
end
