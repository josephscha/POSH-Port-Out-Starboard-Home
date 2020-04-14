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
# This destroy action is going to be called in collector's show page. 
# use cookies to determine if collector owns artwork 
  def destroy
    collector = @artwork.collector
    @artwork.delete(artwork_params)
    redirect_to collector_path(collector)
  end

  private
  
  def artwork_params
    params.require(:artwork).permit(:title, :img_url, :price, :for_sale, :artist_id, :object_type_id, :collector_id)
  end

  def find_artwork
    @artwork = Artwork.find(params[:id])
  end
end
