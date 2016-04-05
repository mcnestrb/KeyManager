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
    	@group = Group.find(:id)
    	@users = User.joins(group_mems: :group).where(groups: :id)
    end

    def add_mem
    	@mem = Group_mem.new(params)
    end

    def kick_mem
    	@mem = Group.find(params)
    	@mem.destroy 

    	redirect_to admin_group_path(params[:group_id])
    end

    private
    	def group_params
    		params.require(:group).permit(:name)
    	end


end
