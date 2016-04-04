class HomeController < ApplicationController
    before_action :authenticate_user!

    def index
        memberships = Group_mem.where(user_id: current_user)
        @groups = Group.(id: memberships.group_id)         
    end
end
