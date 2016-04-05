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
    	user = User.find_by(params[:email])
    	if(user)
    		@mem = GroupUser.new(params[:group], user)
    		@mem.save
    	end
    	
    	redirect_to admin_group_path(params[:group])
    end

    def kick_mem
    	@mem = Group.find(params)
    	@mem.destroy 

    	redirect_to admin_group_path(params[:group])
    end

    private
    	def group_params
    		params.require(:group).permit(:name)
    	end


end
