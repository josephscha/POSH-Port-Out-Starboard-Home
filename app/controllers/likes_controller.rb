class LikesController < ApplicationController
  before_action :find_artwork
    def create
      @liked = Like.create(user_id: @current_user.id, artwork_id: @artwork.id)
      if @liked.valid? 
        redirect_to artwork_path(@artwork.id)
      else
        flash[:error] = "You can only like an Artwork once!!!!!"
        redirect_to @artwork
      end
    end

    private

    def find_artwork
      @artwork = Artwork.find(params[:artwork])
    end

    def like_params
      params.require(:like).permit(:user_id, :artwork_id)
    end
end
