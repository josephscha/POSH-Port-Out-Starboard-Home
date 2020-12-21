class ArtistsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show, :create]
    def index 
        @artists = Artist.name_sort
    end

    def show
        @artist = Artist.find(params[:id])
        @forsale = false 

        if params[:forsale]
            @forsale = true 
            @forsale_artwork = @artist.artworks.for_sale? 
        end
    end

    def create 
        
        @artist = Artist.create(artist_params)
        if @artist.valid?
            redirect_to @artist
        else
            flash[:errors] = @artist.errors.full_messages
            redirect_to new_artist_path
        end
    end

    private 

    def artist_params
        params.require(:artist).permit(:name, :bio)
    end
end
