class HomeController < ApplicationController
    before_action :authenticate_user!

    def index
        @groups = Group.joins(group_users: :user).where("users.id = ?", params[:id])         
    end

    def group
    	mem = GroupUser.find_by(user_id: current_user, group_id: params[:id])
    	if(mem)
    		
    	else
    		redirect_to root_path, notice: "You're not a member of that group"
    	end
    end
end
