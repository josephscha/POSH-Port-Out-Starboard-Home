class LikesController < ApplicationController

    def create
        Like.create(artwork_id: params[:id], user: @current_user)
        redirect_to artwork_path(params[:id])
    end
    
end
