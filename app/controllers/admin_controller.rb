class AdminController < ApplicationController
    before_action :authenticate_admin!

    def index
        @groups = Group.all
    end

    def create
        @group = Group.new(group_params)
        @group.save

        redirect_to admin_path
    end

    def group
    	@group = Group.find_by_id params[:id]
    	@users = User.joins(group_users: :group).where("groups.id = ?", params[:id])
    end

    def add_mem
    	mem_params = params.require(:member).permit(:email, :group)
    	user = User.find_by email: mem_params[:email]
    	if(user)
    		@mem = GroupUser.new(user_id: user.id, group_id: mem_params[:group])
    		@mem.save
    		redirect_to admin_group_path(mem_params[:group])
    	else
    		redirect_to admin_group_path(mem_params[:group]), notice: "That user doesn't exist"
    	end
    end

    def kick_mem
    	@mem = GroupUser.find_by(user_id: params[:user], group_id: params[:group])
    	@mem.destroy 

    	redirect_to admin_group_path(params[:group])
    end

    private
    	def group_params
    		params.require(:group).permit(:name)
    	end

end
