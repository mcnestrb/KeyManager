class Group < ActiveRecord::Base
    has_many :users, through: :group_mems
    has_many :group_mems
end
