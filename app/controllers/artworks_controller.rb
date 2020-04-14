class ArtworksController < ApplicationController
  before_action :find_artwork, only: [:show, :edit, :update, :destroy]
  def index 
    @artworks = Artwork.all
  end

  def show
  end
  
  def new
    @artwork = Artwork.new
  end
  
  def create
    @artwork = Artwork.create(artwork_params)
    if @artwork.valid?
      rediret_to @artwork
    else
      flash[:errors] = @artwork.errors.full_messages
      redirect_to new_artwork_path
    end
  end

  def edit
  end

  def update
    if @artwork.update
      redirect_to @artwork
    else
      flash[:errors] = @artwork.errors.full_messages
      redirect_to edit_artwork_path
    end
  end
# This destroy action is going to be called in user's show page. 
# use cookies to determine if user owns artwork 
  def destroy
    user = @artwork.user
    @artwork.delete(artwork_params)
    redirect_to user_path(user)
  end

  private
  
  def artwork_params
    params.require(:artwork).permit(:title, :img_url, :price, :for_sale, :artist_id, :object_type_id, :user_id)
  end

  def find_artwork
    @artwork = Artwork.find(params[:id])
  end
end
