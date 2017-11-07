class SynopsesController < ApplicationController
  before_action :teacher_only
	def create
		 @synops = Synopsis.new(synopsis_params)

    respond_to do |format|
      if @synops.save
        format.html { redirect_to synopses_path, notice: 'group evaluated' }
       
      else
        redirect_to synopses_path, :alert => 'unable to update'
      end
    end
end
	private
	def synopsis_params
      params.require(:synopsis).permit(:group_id, :title, :ipdr, :opw, :meth)
    end
    def teacher_only
    unless current_user.guide? || current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
 end
end
