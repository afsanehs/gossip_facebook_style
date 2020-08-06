class LikesController < ApplicationController
    before_action :find_gossip
    before_action :require_user

    def index
        @likes = Like.all
    end

    def create 
        @gossip.likes.create(user_id: current_user.id)
        redirect_to city_path 
    end 

    private 

    def find_gossip
        @gossip = Gossip.find(params[:gossip_id])
    end 
end
